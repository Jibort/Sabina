package base

import (
	"context"
	"log"
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
		moodUpdatedAt = TimeStampToDateTime(lmup)
	}

	emotionLastId = pParm.EmoEmotion.LastEmotionId
	var leup = pParm.EmoEmotion.GetLastEmotionUpdate()
	if leup != nil {
		moodUpdatedAt = TimeStampToDateTime(leup)
	}

	rList = &proto.EmoModuleLists{
		Moods:    &proto.EmoMoods{},
		Emotions: &proto.EmoEmotions{},
	}
	rList.Moods = (*EmoMood).FindSyncs(nil, pCtx, moodLastId, moodUpdatedAt, pParm.UserLang)
	rList.Emotions = (*EmoEmotion).FindSyncs(nil, pCtx, emotionLastId, emotionUpdatedAt, pParm.UserLang)
	return
}

func (sSyncDrv *SyncServiceDriver) TranslateIt(pCtx context.Context, pPetition *proto.PrtDownloadTranslation) (rAnswer *proto.PrtTranslation, rErr error) {
	var lang = pPetition.LangId
	log.Printf("MISSATGE NOU TranslateIt (userId: %d, lang: '%s', textkey: '%s'\n", pPetition.UserId, lang, pPetition.TkeyId)

	var trans *LocTranslation
	if trans, rErr = (*LocTranslation).ById(nil, pPetition.TkeyId, true, pPetition.LangId); rErr == nil {
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
