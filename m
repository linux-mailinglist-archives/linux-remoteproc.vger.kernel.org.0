Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F417192FF8
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Mar 2020 18:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgCYR5v (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 25 Mar 2020 13:57:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40314 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgCYR5v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Mar 2020 13:57:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id l184so1411884pfl.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2020 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v8BBQ/NBtZ7/svHHcq03U0gLUqYdrhj6Lz0G3zU1PZk=;
        b=xxOLDXKqmlAPgVZPURyhUio7imVBwD48q3OcN7j2P85LUP3lxGm5Mk/Tm8pPHw10eI
         vbE5+pkVsEppVEfULBlRPczZdcqip6pa+PKdUp9igsoq+5a+x9Vg7AF8uwSzEMV9WIuu
         bzxDrrftAq5zBAsmX1uNJQhCv0KtcyQeFMNx9gWi0itxl3d+EURtNZ6qixJHcW5ryHVg
         HKqdhtMKs6j5MZMeplB52sstUwEhrd9cHd2ul0nwwq51EQVcasu1PUNSVT++oIcUnFy6
         2ajhKjYZHCUqtKf5CQw6slx2CA8ilZPX6MWLIPYZ5InxiQEidt7990CHj9B1wf/jADud
         1Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v8BBQ/NBtZ7/svHHcq03U0gLUqYdrhj6Lz0G3zU1PZk=;
        b=WvP/nI4i0oBkHYY3jzi94O3v2pxlgUwyhU1g+1EYdOOvhUzXXgwVli9jqDYS0qMduY
         vYx5qpE4jHuBScXxfjEwLOa57ihYHnlvw1CAAweZnRvhDiBMyN8zXlUF/ERXRwvQKhTl
         WGL3BqFACP0vs2q+oXk4HtKPczm4v3okoKe0qmzbPtKMw7EtYAbalJEI+dFAdrdgHzF+
         vPbqG/rASGsGo1drYXXs8xrRkwxHbFBe0e0wO1dVSiA0farz4duaMtTrp2sdv18XnPKh
         NfXhCRN8ZymJphNymGetDO9cbN8hqSgaVuozzgYfMMzbC6OcUQVAVFzKk1XH81cLhzQ8
         TzIw==
X-Gm-Message-State: ANhLgQ0PiSmLX31XlJHoqXVT1VMkxpIBZMk7NzCLimlvrazccN7zyQLm
        Pm1QOK7rT2HpcNMM165UKwok0w==
X-Google-Smtp-Source: ADFU+vtV4WUFtlIPFuBfmrUAdAu0jGk7d8jlvipZz8y0G5/pXyJQR3Ta7TXq2tr5swRu+s2P+IRGSg==
X-Received: by 2002:a63:3d06:: with SMTP id k6mr4118268pga.418.1585159069695;
        Wed, 25 Mar 2020 10:57:49 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l15sm7213709pgk.59.2020.03.25.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 10:57:48 -0700 (PDT)
Date:   Wed, 25 Mar 2020 11:57:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic Pallardy <loic.pallardy@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org,
        fabien.dessenne@st.com, s-anna@ti.com
Subject: Re: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc
 is crashed
Message-ID: <20200325175746.GA6227@xps15>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
 <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Loic,

On Wed, Mar 11, 2020 at 11:54:31AM +0100, Loic Pallardy wrote:
> When remoteproc recovery is disabled and rproc crashed, user space
> client has no way to reboot co-processor except by a complete platform
> reboot.
> Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
> state is RPROC_RUNNING.
> 
> This patch offers the possibility to shutdown the co-processor if
> it is in RPROC_CRASHED state and so to restart properly co-processor
> from sysfs interface.

If recovery is disabled on an rproc the platform likely intended to have a hard
reboot and as such we should not be concerned about this case.

Where I think we have a problem, something that is asserted by looking at your 2
patches, is cases where rproc_trigger_recovery() fails.  That leaves the system
in a state where it can't be recovered, something the remoteproc core should not
allow. 

> 
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

Please add a comment that explains how we can be in rproc_shutdown() when the
processor has crashed and point to rproc_trigger_recovery().  See below for more
details. 

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
>  			return -EINVAL;

Wouldn't it be better to just prevent the MCU to stay in a crashed state (when
recovery is not disabled)?

I like what you did in the next patch where the state of the MCU is set to
RPROC_CRASHED in case of failure, so that we keep.  I also think the hunk
above is correct.  All that is left is to call rproc_shutdown() directly in
rproc_trigger_recovery() when something goes wrong.  I would also add a
dev_err() so that users have a clue of what happened.

That would leave the system in a stable state without having to add intelligence
to state_store().

Let me know that you think...

Mathieu

>  
>  		rproc_shutdown(rproc);
> -- 
> 2.7.4
> 
