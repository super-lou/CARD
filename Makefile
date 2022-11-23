# build directory of ASHES R variables

all: AEAG MAKAHO MAKAHOapp

AEAG:
	./manage_variables.R -l AEAG [ QA QMNA VCN10 tDEB_etiage tCEN_etiage ]

MAKAHO:
	./manage_variables.R -l MAKAHO [ Resume [ QJXA QA VCN10 ] Crue [ QJXA tQJXA fA10 fA05 fA01 ] Crue_Nivale [ t_BF v_BF tDEB_BF tCEN_BF tFIN_BF ] Moyennes_Eaux [ Q10 Q25 Q50 Q75 Q90 QA ] Étiage [ QNA QMNA VCN10 t_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] ] -w

MAKAHOapp:
	./manage_variables.R -l MAKAHOapp [ QJXA tQJXA fA10 fA05 fA01 t_BF v_BF tDEB_BF tCEN_BF tFIN_BF Q10 Q25 Q50 Q75 Q90 QA QNA QMNA VCN10 t_etiage vDEF_etiage tDEB_etiage tCEN_etiage tFIN_etiage ] -w -b

.PHONY: AEAG MAKAHO MAKAHOapp
