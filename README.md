# Video Converter PWA

## Description

Video Converter PWA is a Progressive Web Application designed to convert video files into different formats. This application provides a simple and efficient interface for users to upload videos and convert them to their desired format, all within a web browser.

Video Converter PWA est une Application Web Progressive conçue pour convertir des fichiers vidéo dans différents formats. Cette application offre une interface simple et efficace permettant aux utilisateurs de télécharger des vidéos et de les convertir dans le format souhaité, le tout depuis un navigateur web.

## Features / Fonctionnalités

- Easy-to-use interface for video uploading
- Support for multiple output formats (e.g., MP4, WebM)
- Client-side processing for faster conversions
- Progressive Web App capabilities for offline use

- Interface conviviale pour le téléchargement de vidéos
- Prise en charge de plusieurs formats de sortie (par exemple, MP4, WebM)
- Traitement côté client pour des conversions plus rapides
- Capacités d'Application Web Progressive pour une utilisation hors ligne

## Prerequisites / Prérequis

- Ruby 3.3.0
- Rails 7.2.1
- FFmpeg installed on the server
- Modern web browser with JavaScript enabled

- Ruby 3.3.0
- Rails 7.2.1
- FFmpeg installé sur le serveur
- Navigateur web moderne avec JavaScript activé

## Installation

Clone the repository:
Clonez le dépôt :

```bash
git clone https://github.com/doLys/video_converter_pwa.git

Navigate to the project directory:
Accédez au répertoire du projet :

bash
cd video_converter_pwa

Install dependencies:
Installez les dépendances :

bash
bundle install

Set up the database:
Configurez la base de données :

bash
rails db:create db:migrate

Start the Rails server:
Démarrez le serveur Rails :

bash
rails s

Usage / Utilisation

    Open the application in your web browser
    Upload a video file
    Select the desired output format
    Click "Convert" and wait for the process to complete
    Download the converted video
    Ouvrez l'application dans votre navigateur web
    Téléchargez un fichier vidéo
    Sélectionnez le format de sortie souhaité
    Cliquez sur "Convertir" et attendez que le processus soit terminé
    Téléchargez la vidéo convertie

Contributing / Contribution
Contributions are welcome! Please feel free to submit a Pull Request. Les contributions sont les bienvenues ! N'hésitez pas à soumettre une Pull Request.
License / Licence
This project is licensed under the GNU Affero General Public License v3.0 (AGPL-3.0) - see the LICENSE file for details. Ce projet est sous licence GNU Affero General Public License v3.0 (AGPL-3.0) - voir le fichier LICENSE pour plus de détails.
