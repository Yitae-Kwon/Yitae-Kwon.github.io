---
layout: post
title: "Horvitz-Thompson 추정량"
tags: [Sampling]
use_math: true
comments: true
---

### 표본포함확률
**확률표본추출(probability sampling design)**은 모집단의 모든 원소들 각각이 표본에 포함될 확률이 양수인 표본추출 방법을 의미합니다. 이를 다르게 표현하면, 표본이 $A$일 때 각 원소 $i$에 대한 **일차 표본포함확률(first-order inclusion probability)**
\[\pi_i = P(i \in A) = \sum_{A; \; i \in A} P(A)\]
가 모든 $i$에 대하여 $\pi_i > 0$을 만족함을 의미합니다. 한편, 두 원소 $i, j$에 대하여 **이차 표본포함확률(second-order inclusion probability)**
\[\pi_{ij} = P(i, j \in A) = \sum_{A; \; i, j \in A} P(A)\]
를 정의할 수도 있습니다. 만약 모집단이 $U$일 때 모든 $i, j \in U$에 대하여 $\pi_{ij} > 0$이라면, 이러한 표본추출 방법은 **가측표본추출(measurable sampling design)**이라 부릅니다.


### Horvitz-Thompson 추정량
확률표본추출로 얻은 표본에서, 모집단 총계 $Y = \sum_{i=1}^N y_i$의 비편향추정량으로는 **Horvitz-Thompson 추정량(HT estimator)**을 사용할 수 있습니다. 그 형태는
\[\hat{Y}_{\text{HT}} = \sum _{i \in A} \dfrac{y_i}{\pi_i} \]
으로 주어지며, 가장 기본적으로 $Y$의 *비편향추정량*이라는 점에서 자주 사용됩니다. 

이는 매우 간단하게 증명할 수 있습니다. 먼저 $\hat{Y}_{\text{HT}}$의 계산에서 등장하는 $i \in A$에 대한 합산을 표본포함지시변수 $I_i = I(i \in A)$를 이용하여 표현하면, 
\[\hat{Y}_{\text{HT}} = \sum_{i=1}^N \dfrac{y_i}{\pi_i} I_i\]
이며 양변에 기댓값을 씌운다면

\[\text{E}[\hat{Y}_{\text{HT}}] = \sum_{i=1}^N \dfrac{y_i}{\pi_i} \text{E}[I_i] = \sum_{i=1}^N \dfrac{y_i}{\pi_i} \pi_i = Y\]
임을 얻기 때문입니다.

한편 이를 이용하면 분산 역시 쉽게 얻을 수 있습니다. 분산은
\[\text{Var}(\hat{Y}_{\text{HT}}) = \sum_{i = 1}^N \sum_{j=1}^N \dfrac{y_i}{\pi_i} \dfrac{y_j}{\pi_j} \text{Cov}(I_i, I_j)\]
이며
\[\text{Cov}(I_i, I_j) = \text{E}[I_i I_j] - \text{E}[I_i]\text{E}[I_j] = \pi_{ij} - \pi_i \pi_j\]
이기 때문에, 정리하면 
\[\text{Var}(\hat{Y}_{\text{HT}}) = \sum_{i = 1}^N \sum_{j=1}^N (\pi_{ij} - \pi_i \pi_j) \dfrac{y_i}{\pi_i} \dfrac{y_j}{\pi_j}\]
을 얻습니다. 


### Horvitz-Thompson 추정량의 성질들
HT 추정량은 확률추출방법으로 정의된 표본에서만 작동 가능한 총계의 비편향추정량입니다. HT 추정량은 아래와 같은 성질들을 가집니다.

1. HT 추정량은 location-scale invariant하지 않습니다. 즉 선형 변환을 통해 위치와 척도가 다른 표본의 총합을 추정한 것과 해당 표본에서 직접 HT 추정량을 구한 값이 다를 수 있습니다. 이는 
\[\sum_{i \in A} \dfrac{a + by_i}{\pi_i} \neq a + b\sum_{i \in A} \dfrac{y_i}{\pi_i}\]
임으로부터 기인합니다. 

2. 만약 표본의 수가 일정한 고정표본수 추출의 경우, **Sen-Yates-Grundy(SYG) 분산 공식**에 의하여 HT 추정량의 분산은 
\[\text{Var}(\hat{Y}_{\text{HT}}) = -\dfrac{1}{2} \sum_{i=1}^N \sum_{j=1}^N (\pi_{ij} - \pi_i \pi_j) \left(\dfrac{y_i}{\pi_i} - \dfrac{y_j}{\pi_j}\right)^2\]
처럼 쓸 수도 있습니다. 이로부터 우리는 모든 $i$에 대하여 $\pi_i \propto y_i$이도록 $\pi_i$를 설정한다면 HT 추정량은 그 분산이 0으로, 확률 1로 정확한 $Y$값을 추정해내는 매우 효율적인 추정량임을 알 수 있습니다. 단, 실제 상황에서는 $y_i$ 값을 표본 추출 전에는 알 수 없으므로, 표본 설계에 반영하기는 어렵습니다. 

3. 모수가 만약 
\[Q = \sum_{i=1}^N \sum_{j=1}^N q(y_i, y_j)\]
처럼 주어진다면, 가측표본추출 하에서 $Q$의 비편향추정량 중 하나는
\[\hat{Q} = \sum_{i \in A} \sum_{j \in A} \dfrac{1}{\pi_{ij}} q(y_i, y_j)\]
입니다. 

4. 이를 이용하면, HT 추정량의 분산 역시 가측표본추출된 표본에서는 비편향추정량을 가집니다. 이를 식으로 쓰면 
\[\widehat{\text{Var}}(\hat{Y}_{\text{HT}}) = \sum_{i \in A} \sum_{j \in A} \dfrac{\pi_{ij} - \pi_i \pi_j}{\pi_{ij}} \dfrac{y_i}{\pi_i}  \dfrac{y_j}{\pi_j}\]
과 같습니다. 더불어, 고정표본수 추출인 경우 SYG 공식을 이용하면 
\[widehat{\text{Var}}(\hat{Y}_{\text{HT}}) = -\dfrac{1}{2}\sum_{i \in A} \sum_{j \in A} \dfrac{\pi_{ij} - \pi_i \pi_j}{\pi_{ij}} \left(\dfrac{y_i}{\pi_i}  - \dfrac{y_j}{\pi_j}\right)^2\]
으로 쓸 수 있기도 합니다.

5. HT 추정량은 $Y$의 일치추정량입니다.

6. HT 추정량은 점근정규성을 가지고 있기도 합니다. 적절한 조건 하에서, 
\[\dfrac{\hat{Y}_{\text{HT}} - Y}{\sqrt{\widehat{\text{Var}}(\hat{Y}_{\text{HT}})}} \stackrel{d}{\rightarrow} N(0, 1)\]
이며, 이에 따라 $Y$의 근사적인 95퍼센트 신뢰구간은
\[\left(\hat{Y}_{\text{HT}} - 1.96 \sqrt{\widehat{\text{Var}}(\hat{Y}_{\text{HT}})}, \hat{Y}_{\text{HT}} + 1.96 \sqrt{\widehat{\text{Var}}(\hat{Y}_{\text{HT}})}\right)\]
입니다. 


# References
김재광. (2017). 표본조사론. 자유아카데미.
