# Copyright 2022-2023 Louis Héraut (louis.heraut@inrae.fr)*1
#
# *1   INRAE, France
#
# This file is part of CARD R library.
#
# CARD R library is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# CARD R library is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CARD R library.
# If not, see <https://www.gnu.org/licenses/>.


#  _____  _                   _          _     _ 
# |_   _|| |_   _ _  ___  ___| |_   ___ | | __| |
#   | |  | ' \ | '_|/ -_)(_-<| ' \ / _ \| |/ _` |
#   |_|  |_||_||_|  \___|/__/|_||_|\___/|_|\__,_| ____________________
## 1. THRESHOLD __________________________________________________________  
apply_threshold = function (X, lim, where="under", what="X",
                            select="all") {

    lim = lim[1]

    if (where == "under") {
        ID = which(X <= lim)
    } else if (where == "above") {
        ID = which(X >= lim)
    } else {
        stop ("Choose 'under' or 'above'")
    }

    if (is.numeric(select)) {
        select = select[1]
        if (is.na(select)) {
            return (NA)
        }
    }
        
    if (is.numeric(select) | select == "longest" | select == "shortest") {
        dID = diff(ID)
        dID = c(10, dID)
        
        IDjump = which(dID != 1)
        Njump = length(IDjump)
        
        Periods = vector(mode='list', length=Njump)
        XPeriods = vector(mode='list', length=Njump)
        Nperiod = c()
        
        for (i in 1:Njump) {
            idStart = IDjump[i]
            
            if (i < Njump) {
                idEnd = IDjump[i+1] - 1
            } else {
                idEnd = length(ID)
            }
            
            period = ID[idStart:idEnd]
            Periods[[i]] = period
            Nperiod = c(Nperiod, length(period))

            if (is.numeric(select)) {
                if (select %in% X[period]) {
                    period_select = period
                }
            }
        }

        if (select == "longest") {
            period_select = Periods[[which.max(Nperiod)]]

        } else if (select == "shortest") {
            period_select = Periods[[which.min(Nperiod)]]
        }

        if (what == "X") {
            res = X[period_select]
        } else if (what == "length") {
            res = period_select[length(period_select)] - period_select[1] + 1
        } else if (what == "last") {
            res = period_select[length(period_select)]
        } else if (what == "first") {
            res = period_select[1]
        }
        
    } else if (select == "all") {
        if (what == "X") {
            res = X[ID]            
        } else if (what == "length") {
            res = ID[length(ID)] - ID[1] + 1
        } else if (what == "last") {
            res = ID[length(ID)]
        } else if (what == "first") {
            res = ID[1]
        }
    }
    return (res)
}

## 2. USE ____________________________________________________________
compute_VolDef = function (X, upLim, select_longest=TRUE) {
    Xdef = under_threshold(X,
                           lim=upLim,
                           where="under",
                           what="X",
                           select_longest=select_longest)
    Vol = sum(Xdef, na.rm=TRUE)*24*3600 / 10^6 # m^3.s-1 * jour / 10^6 -> hm^3
    return (Vol)
}
