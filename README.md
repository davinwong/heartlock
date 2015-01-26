HeartLock
=========

- Authentication wristband prototype for replacing passwords in website login. Inspired by Nymi.
- Reads user's Electrocardiography (ECG) signal
- The ECG heartbeat signal is a wave with 3 prominent peaks and 2 troughs. Every user has a unique shape
- The amplitudes of peaks and troughs, as well as time displacements between them, are extracted as features
- Collected several hours of data from 3 testers
- Random Forest model trained on 9 features (MATLAB)
- In live tests, HeartLock identified the user with 80% accuracy
