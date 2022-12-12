# build directory of ASHES R variables

all: AEAG MAKAHO MAKAHOapp Ex2D
.PHONY: AEAG MAKAHO MAKAHOapp Ex2D

## 1. ________________________________________________________________
AEAG:
	./manage_variables.R -l AEAG [ QA QMNA VCN10 tDEB_etiage tCEN_etiage ]


## 2. ________________________________________________________________
### 2.1. _____________________________________________________________
MAKAHO:
	./manage_variables.R -l MAKAHO [ Resume [ QJXA QA VCN10 ] Crue [ QJXA tQJXA fA10 fA05 fA01 ] Crue_Nivale [ dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF ] Moyennes_Eaux [ Q10 Q25 Q50 Q75 Q90 QA ] Étiage [ QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] ] -w

### 2.2. _____________________________________________________________
MAKAHOapp:
	./manage_variables.R -l MAKAHOapp [ QJXA tQJXA fA10 fA05 fA01 dt_BF v_BF tDEB_BF tCEN_BF tFIN_BF Q10 Q25 Q50 Q75 Q90 QA QNA QMNA VCN10 dt_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] -w -b


## 3. ________________________________________________________________
Ex2D:
	./manage_variables.R -l Ex2D [ KGE KGE_sqrt NSE NSE_sqrt NSE_log NSE_i Bias Bias_SEA Q10_all Q50_all Q90_all mean{QA} QJXA-10 QMNA-5 VCN10-5 VCN30-2 alphaQJXA alphaQA alphaVCN10 median{tQJXA} median{tVCN10} epsilon_P epsilon_P,SEA epsilon_T epsilon_T,SEA RAT_T RAT_P RAT_ET0 Rc alphaCDC BFI BFM median{dtCrue} ] -w
