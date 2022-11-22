---
layout: post
title:  "DSB-SC System Implementation in MATLAB"
date:   2021-10-17 00:00:00 +0700
tags: project matlab communication
---

A double-sideband suppressed-carrier communication system design project. The design in this project are presented in three major parts, which are modulation, distortion and demodulation of the signal. The project can also be 

Double-Sideband Suppressed-Carrier Communication System Implementation in Matlab.
The DSB-SC system composed of:

1. Modulation of a signal, which modulates the amplitude of the incoming signal
2. Distortion of a signal when it passes through a communication channel
3. Demodulation of a signal, which utilize the low-pass-filter. In which the final signal will form a scaled and distorted version of the original message signal.

## Introduction to DSB-SC and design overview

### Double-sideband suppressed-carrier (DSB-SC) transmission

Double Sideband Suppressed Carrier transmission is the transmission of a modulated wave, which only sidebands are transmitted through the communication system, while the carrier wave is being suppressed.

![]({{ site.baseurl }}/assets/image/dsbsc/1.png)

In example above, the frequency of message and carrier wave is 100Hz and 500Hz respectively and the amplitude of both is 1.

### DSB-SC communication system design problem statement

#### 1.2.1  Design a DSB-SC communication system following the diagram below

![]({{ site.baseurl }}/assets/image/dsbsc/2.png)

Given channel characteristic $$ H(f)=e^{-2j\pi30t}+e^{-2j\pi5t} $$

