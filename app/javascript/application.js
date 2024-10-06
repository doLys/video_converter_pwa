// app/javascript/application.js

import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', () => {
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const formData = new FormData(form);
      formData.append('timestamp', Date.now());

      fetch(form.action, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      })
      .then(response => {
        if (!response.ok) throw new Error('Erreur réseau');
        return response.blob();
      })
      .then(blob => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.style.display = 'none';
        a.href = url;
        a.download = `converted_video_${Date.now()}.${formData.get('output_format')}`;
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);

        // Réinitialiser le formulaire
        form.reset();

        // Effacer le nom du fichier affiché
        const fileInput = document.getElementById('videoFile');
        if (fileInput) {
          fileInput.value = '';
        }
      })
      .catch(error => {
        console.error('Erreur:', error);
        document.getElementById('result').textContent = 'Erreur lors de la conversion. Veuillez réessayer.';
      });
    });
  }
});

