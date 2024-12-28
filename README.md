# Documentación del Proyecto React con Jenkins

## Introducción
Este proyecto implementa una pipeline de integración y despliegue continuo (CI/CD) utilizando Jenkins. La pipeline automatiza procesos clave como la instalación de dependencias, verificación de calidad de código, ejecución de pruebas, actualización de archivos, despliegue en Vercel y notificación en Telegram.

## Conceptos Clave

### Jenkins
Jenkins es una herramienta de automatización de código abierto diseñada para facilitar la integración continua (CI) y entrega continua (CD) en proyectos de software.

- **Open Source**: Gratuito y personalizable.
- **Plugins**: Extensibilidad mediante más de 1,500 plugins.
- **Pipelines**: Permite configurar pipelines declarativas y basadas en scripts mediante `Jenkinsfile`.

### Telegram Bot
Un bot en Telegram permite enviar notificaciones automáticas sobre el estado de la pipeline. Esto ayuda a mantener informados a los desarrolladores en tiempo real.

### Vercel
Vercel es una plataforma de despliegue de aplicaciones que soporta frameworks modernos como React. La integración mediante su CLI simplifica el proceso de despliegue continuo.

## Configuración del Proyecto

### Requisitos Previos
1. **Jenkins**: Instalar y configurar.
2. **Node.js**: Configurar en `Global Tool Configuration` de Jenkins.
3. **Cuenta de Vercel**: Crear una cuenta y generar un token.
4. **Bot de Telegram**: Crear un bot y obtener su token.
5. **Claves SSH**: Configurar una clave SSH para acceso al repositorio GitHub.

### Configuración de la Pipeline

#### Pasos en Jenkins:
1. Crear un nuevo proyecto tipo Pipeline en Jenkins.
2. Configurar credenciales:
   - **GitHub (SSH)**: Para clonar el repositorio.
   - **Telegram**: Guardar el token como `Secret Text`.
   - **Vercel**: Guardar el token como `Secret Text`.
3. Definir la URL del repositorio usando el protocolo SSH (`git@github.com:usuario/repositorio.git`).

#### Estructura del Jenkinsfile

El archivo `Jenkinsfile` define las siguientes etapas:
- **Install Dependencies**: Instala las dependencias necesarias.
- **Linter**: Verifica el código fuente con ESLint.
- **Test**: Ejecuta pruebas unitarias con Jest.
- **Build**: Genera una versión de producción.
- **Update_Readme**: Modifica el archivo README.md con el estado de las pruebas.
- **Push_Changes**: Envía los cambios al repositorio remoto.
- **Deploy to Vercel**: Publica la aplicación en Vercel.
- **Notificación**: Envía un mensaje a Telegram con los resultados.

## Scripts Utilizados

### `sendTelegramMessage.sh`
Envía un mensaje al bot de Telegram con los resultados de la pipeline.

### `pushChanges.sh`
Realiza un commit y push de los cambios realizados al repositorio.

### `updateReadme.js`
Actualiza el archivo `README.md` con un badge de estado basado en los resultados de los tests.

### `deployToVercel.sh`
Despliega la aplicación en la plataforma Vercel utilizando su CLI.

## Resultados Obtenidos
La pipeline se ejecuta automáticamente y realiza todas las tareas definidas. Los resultados se notifican al bot de Telegram en el siguiente formato:

```
S'ha executat la pipeline de Jenkins amb els següents resultats:
- Linter_stage: Correcte
- Test_stage: Correcte
- Update_readme_stage: Correcte
- Deploy_to_Vercel_stage: Correcte
```

## Conclusión
Este proyecto demuestra una implementación efectiva de CI/CD utilizando Jenkins, Telegram y Vercel. La automatización del flujo de trabajo mejora la calidad del software y facilita el despliegue continuo.

## RESULTADO DE LOS ÚLTIMOS TESTS

![Success](https://img.shields.io/badge/tested%20with-Cypress-04C38E.svg)
