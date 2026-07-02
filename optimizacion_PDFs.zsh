#!/bin/sh

# Detectar y usar el shell disponible
if [ -n "$ZSH_VERSION" ]; then
  # Zsh detected
  : # Ya estamos en zsh
elif [ -n "$BASH_VERSION" ]; then
  # Bash detected
  : # Ya estamos en bash
else
  # Intentar encontrar zsh o bash
  if command -v zsh >/dev/null 2>&1; then
    exec zsh "$0" "$@"
  elif command -v bash >/dev/null 2>&1; then
    exec bash "$0" "$@"
  else
    echo "Error: Se requiere zsh o bash para ejecutar este script" >&2
    exit 1
  fi
fi

mostrar_ayuda() {
    cat << EOF
Uso: ${NOMBRE_SCRIPT} [OPCIONES] <archivo.pdf|directorio>

Optimiza archivos PDF reduciendo su tamaño mediante Ghostscript.

OPCIONES:
    -h, --help      Muestra esta ayuda y sale
    -v, --version   Muestra información de versión

ARGUMENTOS:
    <archivo.pdf>   Optimiza un único archivo PDF
    <directorio>    Optimiza todos los archivos PDF en el directorio

EJEMPLOS:
    ${NOMBRE_SCRIPT} documento.pdf          # Optimiza un solo archivo
    ${NOMBRE_SCRIPT} ./mis_pdfs/            # Optimiza todos los PDFs en un directorio
    ${NOMBRE_SCRIPT} doc1.pdf doc2.pdf      # Optimiza múltiples archivos
    ${NOMBRE_SCRIPT} --help                 # Muestra esta ayuda

DESCRIPCIÓN:
    Este script utiliza Ghostscript (gs) para optimizar archivos PDF,
    reduciendo su tamaño mediante ajustes de compresión y configuración.
    Los archivos originales son reemplazados por las versiones optimizadas.
    
    Configuración utilizada: PDFSETTINGS=/prepress (equilibrio entre
    calidad y compresión, adecuado para impresión profesional)
EOF
}

mostrar_version() {
    echo "optimización_PDFs v1.1.0"
    echo "Herramienta de optimización de PDFs usando Ghostscript"
    echo "Shell compatible: zsh y bash"
}

optimizar_pdf() {
    local archivo="$1"
    local archivo_tmp
    
    # Manejar la extensión de forma compatible con ambos shells
    if [ -n "$ZSH_VERSION" ]; then
        archivo_tmp="${archivo:r}-temp.pdf"
    else
        # Para bash: eliminar extensión .pdf
        archivo_tmp="${archivo%.pdf}-temp.pdf"
    fi
    
    echo "Optimizando: $archivo"
    
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 \
       -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET \
       -dBATCH -sOutputFile="$archivo_tmp" "$archivo"
    
    if [ $? -eq 0 ] && [ -f "$archivo_tmp" ]; then
        mv "$archivo_tmp" "$archivo"
        echo "✓ Optimizado y reemplazado: $archivo"
    else
        echo "✗ Error optimizando: $archivo"
        [ -f "$archivo_tmp" ] && rm "$archivo_tmp"
        return 1
    fi
}

# Guardar el nombre del script al inicio
NOMBRE_SCRIPT="$0"

# Procesar opciones de línea de comandos
while [ $# -gt 0 ]; do
    case $1 in
        -h|--help)
            mostrar_ayuda
            exit 0
            ;;
        -v|--version)
            mostrar_version
            exit 0
            ;;
        -*)
            echo "Error: Opción desconocida: $1"
            echo "Use ${NOMBRE_SCRIPT} --help para ver las opciones disponibles"
            exit 1
            ;;
        *)
            # El primer argumento que no es una opción, salir del bucle
            break
            ;;
    esac
    shift
done

# Si no hay argumentos después de procesar opciones, mostrar ayuda
if [ $# -eq 0 ]; then
    echo "Error: Se requiere al menos un archivo PDF o directorio"
    echo ""
    mostrar_ayuda
    exit 1
fi

# Procesar los argumentos restantes (archivos/directorios)
for entrada in "$@"; do
    if [ -f "$entrada" ]; then
        # Es un archivo individual
        if echo "$entrada" | grep -q "\.pdf$"; then
            optimizar_pdf "$entrada"
        else
            echo "Ignorado (no es PDF): $entrada"
        fi
    
    elif [ -d "$entrada" ]; then
        # Es un directorio, procesar todos los PDFs
        echo "Procesando directorio: $entrada"
        for pdf in "$entrada"/*.pdf; do
            if [ -f "$pdf" ]; then
                optimizar_pdf "$pdf"
            fi
        done
    
    else
        echo "No existe: $entrada"
    fi
done

echo "Proceso completado."
