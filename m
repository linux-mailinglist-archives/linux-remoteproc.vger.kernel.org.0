Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D631825E8
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 00:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731465AbgCKXdA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 11 Mar 2020 19:33:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46327 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731364AbgCKXdA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Mar 2020 19:33:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id y30so2026304pga.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2020 16:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jFtJxYlBXZPRO2RwKWg1G8l6JcMWYglI8HGTYAqmsew=;
        b=JIQhcXbXfcHaRXV6xK9j9jFjaK04xEK2zK1aXYUk1j7g75HVKyVzZN8ZWYKEGKhE5s
         D15NknBcABdy1udps3AWRACogBm1E8OKbegCeRR85Y3gGULyTGDZj0rLgGwoJnQf727o
         RBjvHK+Ltv4XdwqEt3yLUZLDq0fgwJiG/wL6BYvlnvmAf2rMB3c9tjqGUPqT0Vp6B5LC
         RrNF4tVBG115YsVipRxDRHQ6+tnmxaPuXJnX0NDq3eKhbUUOlo9wwQ2IOwhDf+9TajX7
         PTkvxD/4PGnUj+P40BgHbI8FpimQnKZcUmEctRzkIJE7E2WDfV90prOz+CwrgTuXdCKy
         tLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jFtJxYlBXZPRO2RwKWg1G8l6JcMWYglI8HGTYAqmsew=;
        b=i4x9T3K1V690orCUDoPAUr2ovmtr4t1kRm00SuruM/j6TD4gDD3fPlNmvRQPEm9lfY
         CHk9R2qbKuAwcbiLXfNPzGsne+1Xk/5SbwkuZcXZn09yepr7qsE/btlMA04CT6MUABdh
         d9kbJZenRpHB7FEqm6rie2dDKDk/bve8JsBQruf72ETHWyNq8UbNQ02KbQfsSKhoThHB
         49ZW3avdb3E5llGJ0US5Eml0mIPbaO+zseRzMxUbXobJiIjzdcxkPTjv9Oo/dZrD/fOH
         pycGuQIT7/MxPagMTMoNoFSMnpAhd+n2bsIysQdFKJFQzhIMi472JV4l6wywvffVB8qe
         DEbw==
X-Gm-Message-State: ANhLgQ1ZhvPLlwsQ6yT9fYhU6rJq3UbRz6TB9IjqpljcmwKyQ/WT9ZYr
        ucdKMrf3mVO+GPYJnvxRsOeHPw==
X-Google-Smtp-Source: ADFU+vvMr21MESHoF4Oe0h0WOAGy0rCZigPm46U7ljAkGUSqeE2xCnjBMD4fI7CoTlicLi0wluHDsw==
X-Received: by 2002:aa7:8055:: with SMTP id y21mr5155708pfm.151.1583969579384;
        Wed, 11 Mar 2020 16:32:59 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a143sm29450741pfd.108.2020.03.11.16.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:32:58 -0700 (PDT)
Date:   Wed, 11 Mar 2020 16:32:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200311233256.GB1214176@minitux>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
 <20200310063338.3344582-3-bjorn.andersson@linaro.org>
 <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com>
 <20200310212728.GQ264362@yoga>
 <158396914211.149997.8114928596665644267@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158396914211.149997.8114928596665644267@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 11 Mar 16:25 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-10 14:27:28)
> > On Tue 10 Mar 13:29 PDT 2020, Stephen Boyd wrote:
> > 
> > > Why can't we search in DT for the
> > > imem node and then find the pil reloc info compatible string on the
> > > first call to this library? Then we don't need an API to see if the
> > > device has probed yet (qcom_pil_info_available)
> > 
> > I think this sounds reasonable.
> 
> Great!
> 
> > 
> > > and we can just ioremap
> > > some region of memory that's carved out for this reason. Forcing
> > > everything through the regmap is mostly adding pain.
> > > 
> > 
> > My concern here was simply that we'll end up ioremapping various small
> > chunks of the imem region 10 (or so) times. But I agree that things
> > would be cleaner here.
> 
> Alright. I'd like the ioremap() approach. ioremap() will "do the right
> thing" and reuse mappings if they're already there and overlap in the
> page. So it's OK that the syscon/simple-mfd exists and makes a device,
> etc. etc., but we don't need to care about it. We can just ioremap() the
> area and not worry that the regmap users may have a mapping to the same
> place. This is a dedicated carveout inside IMEM so we're safe from other
> meddling users.

Agreed, thanks for the feedback!

Regards,
Bjorn
