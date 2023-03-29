
all: AEAG MAKAHO MAKAHOapp Explore2_diag Explore2_proj
.PHONY: AEAG MAKAHO MAKAHOapp Explore2_diag Explore2_proj

## 1. ________________________________________________________________
AEAG:
	./manage_CARD.R -l AEAG [ QA QMNA VCN10 tDEB_etiage tCEN_etiage ]


## 2. ________________________________________________________________
### 2.1. _____________________________________________________________
MAKAHO:
	./manage_CARD.R -l MAKAHO [ Resume [ QJXA QA VCN10 ] Crue [ QJXA tQJXA fA10 fA05 fA01 ] Crue_Nivale [ dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF ] Moyennes_Eaux [ QA10 QA25 QA50 QA75 QA90 QA ] Étiage [ QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] ] -w

### 2.2. _____________________________________________________________
MAKAHOapp:
	./manage_CARD.R -l MAKAHOapp [ QJXA tQJXA fA10 fA05 fA01 dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF QA10 QA25 QA50 QA75 QA90 QA QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] -w -b


## 3. ________________________________________________________________
Explore2_diag:
	./manage_CARD.R -d Q_obsQ_sim -l Explore2_diag [ criteria [ all [ KGE KGEracine NSE NSEracine NSElog NSEinv Biais Biais_SEA STD Rc epsilon_P epsilon_P,SEA epsilon_T epsilon_T,SEA RAT_T RAT_P RAT_ET0 Q10 QJXA-10 alphaQJXA median{tQJXA} median{dtCrue} Q50 mean{QA} alphaCDC alphaQA Q90_all QMNA-5 VCN30-2 VCN10-5 alphaVCN10 median{tVCN10} median{dtRec} BFI BFM ] select [ KGEracine Biais epsilon_T,SEA epsilon_P,SEA RAT_T RAT_P Q10_all median{tQJXA} alphaCDC alphaQA Q90 median{tVCN10} ] ] serie [ QM PA QA median{QJ} median{QJ}C5 FDC ] ] -w

Explore2_proj:
	./manage_CARD.R -d Q -l Explore2_proj [ serie [ QA QA_janv QA_févr QA_mars QA_avr QA_mai QA_juin QA_juill QA_août QA_sept QA_oct QA_nov QA_déc QA_DJF QA_MAM QA_JJA QA_SON QA05 QA10 QA50 QA90 QA95 QJXA VCX3 QMNA VCN10 VCN3 ] ] -w
