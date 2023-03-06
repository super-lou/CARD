
all: AEAG MAKAHO MAKAHOapp Ex2D
.PHONY: AEAG MAKAHO MAKAHOapp Ex2D

## 1. ________________________________________________________________
AEAG:
	./manage_CARD.R -l AEAG [ QA QMNA VCN10 tDEB_etiage tCEN_etiage ]


## 2. ________________________________________________________________
### 2.1. _____________________________________________________________
MAKAHO:
	./manage_CARD.R -l MAKAHO [ Resume [ QJXA QA VCN10 ] Crue [ QJXA tQJXA fA10 fA05 fA01 ] Crue_Nivale [ dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF ] Moyennes_Eaux [ Q10 Q25 Q50 Q75 Q90 QA ] Étiage [ QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] ] -w

### 2.2. _____________________________________________________________
MAKAHOapp:
	./manage_CARD.R -l MAKAHOapp [ QJXA tQJXA fA10 fA05 fA01 dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF Q10 Q25 Q50 Q75 Q90 QA QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] -w -b


## 3. ________________________________________________________________
Ex2D:
	./manage_CARD.R -d Qobs_Qsim -l Ex2D [ indicator [ all [ KGE KGEracine NSE NSEracine NSElog NSEinv Biais Biais_SEA STD Rc epsilon_P epsilon_P,SEA epsilon_T epsilon_T,SEA RAT_T RAT_P RAT_ET0 Q10_all QJXA-10 alphaQJXA median{tQJXA} median{dtCrue} Q50_all mean{QA} alphaCDC alphaQA Q90_all QMNA-5 VCN30-2 VCN10-5 alphaVCN10 median{tVCN10} median{dtRec} BFI BFM ] selection [ KGEracine Biais epsilon_T,SEA epsilon_P,SEA RAT_T RAT_P Q10_all median{tQJXA} alphaCDC alphaQA Q90_all median{tVCN10} ] ] serie [ QM PA QA median{QJ} median{QJ}C5 FDC ] ] -w
