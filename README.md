
# Para empezar con SQL Server

- [Para empezar con SQL Server](#para-empezar-con-sql-server)
- [Guia de estudio](#guia-de-estudio)
- [Herramientas](#herramientas)

# Guia de estudio

Publicaciones:
- Configuración
  - Servidor/Instancia
  - BBDD sistema
  - BBDD usuario
- Mantenimiento
  - Errorlog
  - Trazas/Eventos Extendidos
  - Bases de datos [copias de seguridad](/Mantenimiento/copias_de_seguridad.ipynb)
  - Objetos (tablas, e índices)
      - [Análisis de fragmentación](/Mantenimiento/analisis_fragmentacion.ipynb)
      - [Defragmentación](/Mantenimiento/defragmentacion.ipynb)
- Planes de ejecución
  - Fundamentos de planes de ejecución
  - Operadores habituales
  - Otros operadores
- Tablas
  - Heaps
  - Indice clustered, non-clustered, y filtered
  - Indices column-store
  - Indices In-Memory
- Bloqueos
  - [Fundamentos de bloqueos](/Bloqueos/00-Fundamentos-de-bloqueos.md)
  - [Técnicas de análisis de bloqueos](/Bloqueos/01-Tecnica-de-analisis-de-bloqueos.md)
  - Ejercicios
    - [DATABASE como resource_type](/Bloqueos/ej01-DATABASE-como-resource_type.md)
    - [Índice bloqueado](/Bloqueos/ej02-Indice-bloqueado.md) 
- Query Store
- Arquitectura
  - [Borrados lógicos](/Arquitectura/BorradosLogicos/Borrados-logicos.ipynb)
- Monitorización
  - DMVs
  - GUI
  - Análisis de eficiencia -- Referencia para clientes [trazas vs XEvents](/Monitorizacion/trazas-Xevent.ipynb)
  - Análisis de eficienica -- Referencia para clientes [trazas vs Auditing](/Monitorizacion/trazas-Auditing.ipynb)

# Herramientas

- SQL Server Managemen Studio - [Descarga](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
  - [Teclas rápidas](https://learn.microsoft.com/en-us/sql/ssms/sql-server-management-studio-keyboard-shortcuts?source=recommendations&view=sql-server-ver16)
- Azure Data Studio - [Descarga](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16)
  - [Teclas rápidas](https://learn.microsoft.com/en-us/sql/azure-data-studio/keyboard-shortcuts?view=sql-server-ver16)
- Visual Studio Code - [Descarga](https://code.visualstudio.com/download)
  - Extensiones: [SQL Tools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools), [Bicep](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep), [Markdown](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one), [Powershell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
  - [Teclas rápidas](png/keyboard-shortcuts-windows.pdf), [teclas rápidas (2)](https://www.sitepoint.com/visual-studio-code-keyboard-shortcuts/)
  
  

