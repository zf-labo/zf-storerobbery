local Translations = {
    notify = {
        failedminigame = 'You failed you idiot!',
        opening = 'Opening...',
        alreadyopen = 'Can\'t do this at the moment',
        nopick = 'You doesn\'t have the tools to force this',
    },
    progress = {
        opening = 'Opening...',
    },
    target = {
        unlockregister = 'Rob Register',
        cracksafe = 'Crack Safe',
    },
    police = {
        bliptitle = 'Store Robbery',
        message = 'Store Robbery',
        code = '10-00',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})