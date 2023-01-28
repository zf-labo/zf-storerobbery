local Translations = {
    notify = {
        failedminigame = 'You Failed, Idiot!',
        opening = 'Opening...',
        alreadyopen = 'Register Emptied...',
        nopick = 'You Don\'t Have The Tools To Open This',
        gotnothing = 'You got nothing from it.',
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