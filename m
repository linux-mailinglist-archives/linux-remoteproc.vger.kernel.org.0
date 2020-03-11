Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F196D1825D1
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 00:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbgCKX1M (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 11 Mar 2020 19:27:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33052 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731392AbgCKX1M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Mar 2020 19:27:12 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay11so1848365plb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2020 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B+P5HzLaM16ohcAsqpflA7I9ODGTAOGyeegeNgXsSGE=;
        b=syfha4jgJwh+J6XhF5bW8uBcSARH9kAztF+dhRPJfttxgccsdTy/AIVri3rvRv3Fwa
         9F2EnXPRiUI9CDsgVUXb1mCcNiXrC6ydkdtm3Nn9enXB0wfjL2QAo4zCRAvIGnOSST81
         AsloIi0gUQg9GWtBsqUVkjIp3pJMk36kOSMARfDCMmVLmdfBAYLRhngnawfY6OUwohoA
         XumBRAwyC213wzT/B0iJOWjo/SvqphaglAE5DBtPSTv16o7XSS6t3DrcQfEmf1Mckq6J
         SF/yas8PBIS5C9CHdC1KnJuDJWGWZeVFgGFPcov0fk5yG5KSBm4XhLvlxEktqCMXZYXA
         BKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B+P5HzLaM16ohcAsqpflA7I9ODGTAOGyeegeNgXsSGE=;
        b=jrt/9GkNbnX9Edhmnzc2srBVg2UxP+Sz5x35ZWmnKJitRi3OOR7JK3YSAahTcGFJ+B
         f2U/y/LUvxKtEIJRqeYi9dG1aFFqEnflA9Hl5YamLo9gzMapbgGQiaTjK9vucMBcYhHe
         i1hKsju9ilEsVxe4V1ivFEBF2GxNmo3ZokOhodlW/I5G80KQl6wD1I8D/fhyjZrvT0vs
         69+41A1vFbo3B3GXE9EjoQYC6sZgFpY8auV4YlMHk2zuC1QMt3pISbZ36iqZQezDWPmb
         aWZ16mDuxZug13Eph1Nju4nlh/c3m360CY1ioBi+o1JHxQL5qbQppbx5A1/L0qp18Zod
         Ej8w==
X-Gm-Message-State: ANhLgQ3e6BENLrvEX9wnJFTMMlNQrB5ydc7IBTkLb4jd4c52X9WFVwIk
        jQGZSdWhVQr2+lY2+KmDPwaN3w==
X-Google-Smtp-Source: ADFU+vvBwEs7gVR5id+E8qDY6/R8/eSfPSWztv+mHnxr2PAnEwGaXhNDzZBYPfZ8d7+aIzGBxoLimw==
X-Received: by 2002:a17:90a:1a51:: with SMTP id 17mr1108757pjl.118.1583969230836;
        Wed, 11 Mar 2020 16:27:10 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y7sm12371229pfq.159.2020.03.11.16.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:27:10 -0700 (PDT)
Date:   Wed, 11 Mar 2020 16:27:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Pallardy <loic.pallardy@st.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org,
        fabien.dessenne@st.com, s-anna@ti.com
Subject: Re: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc
 is crashed
Message-ID: <20200311232707.GA1214176@minitux>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
 <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 11 Mar 03:54 PDT 2020, Loic Pallardy wrote:

> When remoteproc recovery is disabled and rproc crashed, user space
> client has no way to reboot co-processor except by a complete platform
> reboot.
> Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
> state is RPROC_RUNNING.
> 
> This patch offers the possibility to shutdown the co-processor if
> it is in RPROC_CRASHED state and so to restart properly co-processor
> from sysfs interface.
> 

I did recently run into a similar problem when I fed my remoteproc
faulty firmware, which lead to it recovering immediately upon boot. The
amount of time spent in !CRASHED state was minimal, so I didn't have any
way to stop the remoteproc.

> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 2 +-
>  drivers/remoteproc/remoteproc_sysfs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..7ac87a75cd1b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1812,7 +1812,7 @@ void rproc_shutdown(struct rproc *rproc)
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	ret = rproc_stop(rproc, rproc->state == RPROC_CRASHED);

Afaict this is unrelated to the problem you're describing in the commit
message.

>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..1029458a4678 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -101,7 +101,7 @@ static ssize_t state_store(struct device *dev,
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_CRASHED)

Analogous to the problem reported by Alex here
https://patchwork.kernel.org/patch/11413161/ the handling of stop seems
racy.

In particular, I believe you're failing to protect against a race
with a just scheduled rproc_crash_handler_work() being executed after
the mutex_unlock() in rproc_shutdown()...

With Alex fix that should be less of a problem though...

Regards,
Bjorn

>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> -- 
> 2.7.4
> 
