Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C839AF9884
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 19:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKLSWo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 13:22:44 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46445 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfKLSWn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 13:22:43 -0500
Received: by mail-pf1-f196.google.com with SMTP id 193so13899796pfc.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Nov 2019 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eN2ydQIW1tC0Y5Z0139/3auQ6iVhazzk9qa2dg7E35A=;
        b=MWBU2TrWEjnv7/l1uY+2LGCdf2/o3Ps8RrNThkke2K6F5E2Kd7kAIELZvATtRT5rpo
         44FXpxsAjez8dSk53I99VA17eLO+/DHGY2TcyBtnlWFy55VrQ8bW5P4CmBQULXQ6Jyz/
         qAVTlGOcsac833IhAMBPJ2Aj/vcOobVMXUx/Vl77MUJlBY7ePRdUfWqHzPb+odViVwwv
         ILKi2oqNsZ+N92V9GB9awn5VUVN+kraXUpzEzLJQcj5osoE1MSaLog1Kqzec9YdnZSMj
         aqNP8LjsnUfceLLGOd7VirMYcn8Yryhe5YAqX+dmewAnlGkPHMt11OrG/hihxNrexAme
         4Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eN2ydQIW1tC0Y5Z0139/3auQ6iVhazzk9qa2dg7E35A=;
        b=FUjaSw0wn2PPaU4Ck8M7cym0I9lhToWpTOF35Pj/h9KLsR5QwQ9J/SYfT+C3SZkG9w
         ZhHG46X2NK4yzFGN/HHTcFZevE+m9m/QgqYmusy7frTtFk5jr+XPwCKHoSCzWCEONgl8
         zWfT9SFToqANjHJrhMmBf3yCDeVRkGsHHxJrU4NNRIjEP604DSMgwRza/1jV3zN2/ONI
         59OV6tXsBVqTJeOL/JLUncYv4AulBoEg+4eaTp8EQ4ardP4QybR+Oz8+WDgscMFA70Hw
         2NRhfiXutDEHWREZxP04S3e30O6RrqDI/b15JMQhk2qA6zhAXJnpGmCMweHtnXOmeAK8
         iwwQ==
X-Gm-Message-State: APjAAAWjxWmEXAeqehPWV8IrL+VTtkYVcKwQueNjpvD7rym7rxldpKIN
        aM2oOxd+sk8SpWRApb5ifbxBFA==
X-Google-Smtp-Source: APXvYqyNFBPp/s1UwzZ90jSmHOfBQDutaWu+vqexmr5bu/ksMtz7nUUVT9E1TsDpGP8PNhA0IjGiIw==
X-Received: by 2002:a17:90a:2470:: with SMTP id h103mr8728391pje.12.1573582962818;
        Tue, 12 Nov 2019 10:22:42 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e24sm3139075pjt.18.2019.11.12.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 10:22:42 -0800 (PST)
Date:   Tue, 12 Nov 2019 10:22:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien DESSENNE <fabien.dessenne@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2] remoteproc: stm32: fix probe error case
Message-ID: <20191112182239.GA21530@yoga>
References: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
 <20191111220416.GB3108315@builder>
 <392808fa-1504-233f-234b-0cca21886c17@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <392808fa-1504-233f-234b-0cca21886c17@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 12 Nov 06:09 PST 2019, Fabien DESSENNE wrote:

> Hi Bjorn,
> 
> 
> On 11/11/2019 11:04 PM, Bjorn Andersson wrote:
> > On Mon 07 Oct 00:39 PDT 2019, Fabien Dessenne wrote:
> >
> >> If the rproc driver is probed before the mailbox driver and if the rproc
> >> Device Tree node has some mailbox properties, the rproc driver probe
> >> shall be deferred instead of being probed without mailbox support.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >> Changes since v1: test IS_ERR() before checking PTR_ERR()
> >> ---
> >>   drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
> >>   1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index 2cf4b29..a507332 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
> >>   	}
> >>   };
> >>   
> >> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> >> +static int stm32_rproc_request_mbox(struct rproc *rproc)
> >>   {
> >>   	struct stm32_rproc *ddata = rproc->priv;
> >>   	struct device *dev = &rproc->dev;
> >> @@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
> >>   
> >>   		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> >>   		if (IS_ERR(ddata->mb[i].chan)) {
> >> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> >> +				return -EPROBE_DEFER;
> > If for some reason you get EPROBE_DEFER when i > 0 you need to
> > mbox_free_channel() channels [0..i) before returning.
> 
> The mailbox framework returns EPROBE_DIFFER to inform that the mailbox 
> provider has not registered yet. I do not expected to have a success 
> followed by a EPROBE_DEFER error.
> 
> But in the very special case where we use two different mailbox 
> providers this may happen.
> 

I agree, it's unlikely to ever cause any problems...

> I will send an updated version, thanks for pointing this.
> 

I appreciate that.

Thanks,
Bjorn

> BR
> 
> Fabien
> 
> >
> > Regards,
> > Bjorn
> >
> >>   			dev_warn(dev, "cannot get %s mbox\n", name);
> >>   			ddata->mb[i].chan = NULL;
> >>   		}
> >>   	}
> >> +
> >> +	return 0;
> >>   }
> >>   
> >>   static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> >> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>   	if (ret)
> >>   		goto free_rproc;
> >>   
> >> -	stm32_rproc_request_mbox(rproc);
> >> +	ret = stm32_rproc_request_mbox(rproc);
> >> +	if (ret)
> >> +		goto free_rproc;
> >>   
> >>   	ret = rproc_add(rproc);
> >>   	if (ret)
> >> -- 
> >> 2.7.4
> >>
