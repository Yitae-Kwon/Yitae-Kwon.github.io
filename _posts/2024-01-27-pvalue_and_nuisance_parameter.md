---
layout: post
title: "P value maximized over a confidence set for the nuisance parameter"
tags: [Miscellaneous]
use_math: true
comments: true
---


우리가 검정을 수행하는 방법에는 크게 두 가지가 있습니다. 첫째는 적당한 검정통계량과 그 귀무가설의 영분포, 기각역을 구한 뒤 표본으로부터 얻은 검정통계량이 여기에 속하는지 확인하는 것입니다. 둘째는 p값을 구하고 이 p값이 유의수준 $\alpha$와 비교하여 작으면 귀무가설을 기각하는 방법입니다. 

한편 이렇게 p값을 구하여 가설을 검정하려 할 때, 자주 접하는 상황은 검정에서 관심이 있는 모수가 아닌 다른 모수, 즉 **장애모수(nuisance parameter)**가 검정에 필요한 상황입니다. 이 경우 우리는 장애모수에 대한 어떠한 추론도 원하지 않지만, 검정을 위하여 장애모수가 필요합니다.

### Pedagogical Example About a Normal Mean
간단한 상황으로, 
$$X_i \sim_{i.i.d} N(\mu, \sigma^2), \quad i = 1, 2, \cdots, n$$
의 표본을 얻어 
$$H_0: \mu = \mu_0, \; \textnormal{vs.} \; H_1: \mu \neq \mu_1$$
을 검정하는 상황을 고려하여 봅시다. 이 경우 모수모형에는 $\sigma^2$이 포함되면서, 가설 검정과 추론에서는 관심을 주지 않기에 $\sigma^2$은 장애모수입니다. 

만약 $\sigma^2$이 어떤 값인지 알고 있다면, 가장 효율적인 검정은 z-통계량
$$Z = \dfrac{\sqrt{n}(\bar{X} - \mu_0)}{\sigma}$$
를 사용해 검정을 진행하는 것이며, 양방향 p값은 $\sigma^2$에 대한 함수 
$$p(\sigma^2) = 2\Phi(-|z_{\textnormal{obs}}|)$$
으로 얻어지는 것이 일반적입니다.

그러나 $\sigma^2$이 무슨 값인지 모른다면, 우리는 그 검정을 위하여 t-검정을 주로 사용합니다. 다르게 말하면, $\sigma^2$을 추정해야 하는 과정이 부차적으로 들어가야 하며, 표본분산 $s^2$에 관련한 적절한 검정 방법이 개발되어 있어야만 합니다. 이 케이스는 매우 간단하기에 다행히도 t-검정을 사용하면 되지만, 그러지 못한 경우가 더욱 많습니다.

### Behrens-Fisher Problem

### Confidence Interval Method and Remedies


# References
Berger, R. L., & Boos, D. D. (1994). P values maximized over a confidence set for the nuisance parameter. Journal of the American Statistical Association, 89(427), 1012-1016.
