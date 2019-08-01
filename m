Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD6F7E326
	for <lists+linux-remoteproc@lfdr.de>; Thu,  1 Aug 2019 21:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388540AbfHATMf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 1 Aug 2019 15:12:35 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46916 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388407AbfHATMf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Aug 2019 15:12:35 -0400
Received: by mail-pl1-f194.google.com with SMTP id c2so32593191plz.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Aug 2019 12:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u3M46kJjAPF4b1mqVIN/QqF1xk0nbqKlZydzEhZoL6s=;
        b=Iu1CH4ToXYW90mTOdeHkqHqps0H4/Jt6nXnjawYRwpFRpCQ3R+FOjlvAHtsf0q+cca
         g/GwPjYINrkuM0M27UfcxGN0Hpzq1z+zbIQRr9A8cLNBE6045TW8YO5B1jv+3zrSM+AI
         RwmR2ijMX/YKSlorl4qZN6W9VRTC6OW7Mk6NYDrjpVniQ6cLad/+XzqpNwinuFtcNb6o
         GTdsYR1aNvUhF9KHd0BLzgdnZis8Y+VjfG/T5HxcorMnvqNAW8q864HiIsdjCkh4XWvu
         mGmSsJd4vy/0+OKrbqrS2lRjhwOvHCzqJiDH6nI0GAHQ2FHm8Lic/V7jrb83izS6/2/D
         KuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u3M46kJjAPF4b1mqVIN/QqF1xk0nbqKlZydzEhZoL6s=;
        b=EOo1oHlQDuzfcTE+czlyngQbOGdIo8gIGRZB+urELe7GOfya1UlW7gJk49cPcfmB3Q
         7GHFJ0rUyOq7N232Ad44iNaT6Nm4+QRhNQCdT1TuBe/Hm4wdoL0TL9Wn4n7ZehHq4gFy
         lkNUXnvQryZKt3rpjyL0CEUc6Hvp3QP7Q0GSz6mtEisUok5uswBkkNtC3pZ0DMvo5tQH
         MDfsb8SYNjZCc4gqR1gfcm06mL6Tb6nZeEnK5oKicNUq+J8uZSE+ETpU1n4tDmCzn+Or
         KIKjFnZouKCSDB16FrQjiZVF6G+A3E4G4tvzZPPFk+91sxAAYWf+dULPgMF7wS2VVVS7
         ec7A==
X-Gm-Message-State: APjAAAXyp3dnftjw5diOxtjtZRPEk+EXt/268K402DBIXtJNeeBoBaHu
        w00QMTTrfJfoz4uFz1dMKLk/bQ==
X-Google-Smtp-Source: APXvYqyXQfNjDuCkBrlF9sH4WaQpLYB6kh01jQJmr+SAa0EdEbp3B9CGOkSzrUP/hpK0bXspTKw35A==
X-Received: by 2002:a17:902:d90a:: with SMTP id c10mr124505738plz.208.1564686753720;
        Thu, 01 Aug 2019 12:12:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q4sm5434151pjq.27.2019.08.01.12.12.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 12:12:33 -0700 (PDT)
Date:   Thu, 1 Aug 2019 12:14:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH 0/6] hwspinlock: allow sharing of hwspinlocks
Message-ID: <20190801191403.GA7234@tuxbook-pro>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 13 Mar 08:50 PDT 2019, Fabien Dessenne wrote:

> The current implementation does not allow two different devices to use
> a common hwspinlock. This patch set proposes to have, as an option, some
> hwspinlocks shared between several users.
> 
> Below is an example that explain the need for this:
> 	exti: interrupt-controller@5000d000 {
> 		compatible = "st,stm32mp1-exti", "syscon";
> 		interrupt-controller;
> 		#interrupt-cells = <2>;
> 		reg = <0x5000d000 0x400>;
> 		hwlocks = <&hsem 1>;
> 	};
> The two drivers (stm32mp1-exti and syscon) refer to the same hwlock.
> With the current hwspinlock implementation, only the first driver succeeds
> in requesting (hwspin_lock_request_specific) the hwlock. The second request
> fails.
> 
> 
> The proposed approach does not modify the API, but extends the DT 'hwlocks'
> property with a second optional parameter (the first one identifies an
> hwlock) that specifies whether an hwlock is requested for exclusive usage
> (current behavior) or can be shared between several users.
> Examples:
> 	hwlocks = <&hsem 8>;	Ref to hwlock #8 for exclusive usage
> 	hwlocks = <&hsem 8 0>;	Ref to hwlock #8 for exclusive (0) usage
> 	hwlocks = <&hsem 8 1>;	Ref to hwlock #8 for shared (1) usage
> 
> As a constraint, the #hwlock-cells value must be 1 or 2.
> In the current implementation, this can have theorically any value but:
> - all of the exisiting drivers use the same value : 1.
> - the framework supports only one value : 1 (see implementation of
>   of_hwspin_lock_simple_xlate())
> Hence, it shall not be a problem to restrict this value to 1 or 2 since
> it won't break any driver.
> 

Hi Fabien,

Your series looks good, but it makes me wonder why the hardware locks
should be an exclusive resource.

How about just making all (specific) locks shared?

Regards,
Bjorn

> Fabien Dessenne (6):
>   dt-bindings: hwlock: add support of shared locks
>   hwspinlock: allow sharing of hwspinlocks
>   dt-bindings: hwlock: update STM32 #hwlock-cells value
>   ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>   ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
>   ARM: dts: stm32: hwlocks for GPIO for stm32mp157
> 
>  .../devicetree/bindings/hwlock/hwlock.txt          | 27 +++++--
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        |  6 +-
>  Documentation/hwspinlock.txt                       | 10 ++-
>  arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  2 +
>  arch/arm/boot/dts/stm32mp157c.dtsi                 | 10 +++
>  drivers/hwspinlock/hwspinlock_core.c               | 82 +++++++++++++++++-----
>  drivers/hwspinlock/hwspinlock_internal.h           |  2 +
>  7 files changed, 108 insertions(+), 31 deletions(-)
> 
> -- 
> 2.7.4
> 
