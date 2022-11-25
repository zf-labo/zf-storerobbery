local Translations = {
    notify = {
        failedminigame = 'Tu n\'as pas réussi, Imbécile!',
        opening = 'Ouverture...',
        alreadyopen = 'Impossible de faire cela pour le moment',
        nopick = 'Tu n\'as pas les outils pour forcer cela',
    },
    progress = {
        opening = 'Ouverture...',
    },
    target = {
        unlockregister = 'Forcer la caisse',
        cracksafe = 'Craquer le coffre',
    },
    police = {
        bliptitle = 'Vol de Magasin',
        message = 'Vol de Magasin',
        code = '10-00',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})