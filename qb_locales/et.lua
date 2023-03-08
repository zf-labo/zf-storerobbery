local Translations = {
    notify = {
        failedminigame = 'Sul läks nässu!',
        opening = 'Avanes...',
        alreadyopen = 'Kass on tühi...',
        nopick = 'Sul pole vajaminevaid asju',
        gotnothing = 'Sa ei saanud midagi.',
    },
    progress = {
        opening = 'Varastad...',
    },
    target = {
        unlockregister = 'Röövi poekassat',
        cracksafe = 'Puuri seifi',
    },
    police = {
        bliptitle = 'Poerööv',
        message = 'Poerööv',
        code = '10-00',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
