new window.JustValidate('#inscription', {
    rules: {
      'pseudo': {
        required: true,
      },
      'email': {
        required: true,
        email: true,
      },
      'password': {
        required: true,
        strength: {
          custom: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/,
          message: 'Le mot de passe doit contenir au moins 8 caractères, dont au moins une lettre et un chiffre.',
        },
      },
      'password-conf': {
        required: true,
        equalTo: '#password',
      },
    },
    'messages': {
      username: {
        required: 'Veuillez remplir le champ Nom d\'utilisateur.',
      },
      'email': {
        required: 'Veuillez fournir une adresse e-mail.',
        email: 'Veuillez fournir une adresse e-mail valide.',
      },
      'password': {
        required: 'Veuillez fournir un mot de passe.',
      },
      'confirm-password': {
        required: 'Veuillez confirmer le mot de passe.',
        equalTo: 'Les mots de passe ne correspondent pas.',
      },
    },
  });