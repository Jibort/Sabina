package drivers

import (
	"context"
	"log"
	"sabina/base/domain"
	tools "sabina/base/domain/tools"
	proto "sabina/proto"
	"time"
)

type SyncServiceDriver struct {
	proto.UnimplementedSyncServiceServer
	closeFn func()
}

func NewSyncServiceDriver(pCloseFn func()) *SyncServiceDriver {
	return &SyncServiceDriver{
		closeFn: pCloseFn,
	}
}

func (sSyncDrv SyncServiceDriver) CheckEmoMod(pCtx context.Context, pParm *proto.GbSyncEmoMod) (rList *proto.EmoModuleLists, rErr error) {
	log.Printf("MISSATGE NOU CheckEmoMod: %s\n", pParm)

	var moodLastId, emotionLastId int32
	var moodUpdatedAt, emotionUpdatedAt *time.Time

	if pParm.UserLang == "" {
		pParm.UserLang = "es"
	}

	moodLastId = pParm.EmoMood.GetLastMoodId()
	var lmup = pParm.EmoMood.GetLastMoodUpdate()
	if lmup != nil {
		moodUpdatedAt = tools.TimeStampToDateTime(lmup)
	}

	emotionLastId = pParm.EmoEmotion.LastEmotionId
	var leup = pParm.EmoEmotion.GetLastEmotionUpdate()
	if leup != nil {
		moodUpdatedAt = tools.TimeStampToDateTime(leup)
	}

	rList = &proto.EmoModuleLists{
		Moods:    &proto.EmoMoods{},
		Emotions: &proto.EmoEmotions{},
	}
	rList.Moods = (*domain.EmoMood).FindSyncs(nil, pCtx, moodLastId, moodUpdatedAt, pParm.UserLang)
	rList.Emotions = (*domain.EmoEmotion).FindSyncs(nil, pCtx, emotionLastId, emotionUpdatedAt, pParm.UserLang)
	return
}

func (sSyncDrv *SyncServiceDriver) TranslateIt(pCtx context.Context, pPetition *proto.PrtDownloadTranslation) (rAnswer *proto.PrtTranslation, rErr error) {
	var lang = pPetition.LangId
	log.Printf("MISSATGE NOU TranslateIt (userId: %d, lang: '%s', textkey: '%s'\n", pPetition.UserId, lang, pPetition.TkeyId)

	var trans *domain.LocTranslation
	if trans, rErr = (*domain.LocTranslation).ById(nil, pPetition.TkeyId, true, pPetition.LangId); rErr == nil {
		var prtTrans *proto.LocTranslation
		if prtTrans, rErr = trans.ToProto(lang); rErr == nil {
			locale := prtTrans.Locale
			tkey := prtTrans.TextKey

			rAnswer = &proto.PrtTranslation{
				Locale:      locale,
				TextKey:     tkey,
				Translation: prtTrans,
			}
		}
	}
	return
}
