#!/bin/sh
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/Nominal/EG_RESOLUTION_ALL1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/EG_RESOLUTION_ALL1up/EG_RESOLUTION_ALL1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/EG_RESOLUTION_ALL1down/EG_SCALE_ALL1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/EG_SCALE_ALL1up/EG_SCALE_ALL1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/EG_SCALE_ALL1down/MUONS_ID1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_ID1up/MUONS_ID1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_ID1down/MUONS_MS1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_MS1up/MUONS_MS1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_MS1down/MUONS_SAGITTA_RESBIAS1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SAGITTA_RESBIAS1up/MUONS_SAGITTA_RESBIAS1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SAGITTA_RESBIAS1down/MUONS_SAGITTA_RHO1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SAGITTA_RHO1up/MUONS_SAGITTA_RHO1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SAGITTA_RHO1down/MUONS_SCALE1up/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SCALE1up/MUONS_SCALE1down/g' ZdZdPlottingAlgJobOptions.py
athena ZdZdPlottingAlgJobOptions.py
sed -i 's/MUONS_SCALE1down/Nominal/g' ZdZdPlottingAlgJobOptions.py

