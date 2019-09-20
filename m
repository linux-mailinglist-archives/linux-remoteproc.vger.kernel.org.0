Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F80FB89F1
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Sep 2019 06:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437156AbfITESo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 20 Sep 2019 00:18:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45173 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437143AbfITESo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Sep 2019 00:18:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so3625681pfb.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2019 21:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ru2v+D3BKbQXHdK6oP95hVcWGBqQtKaZoxkk1jRrl3c=;
        b=ThCjkrH4kiDFaNcLiNv9F0iKG0xVuSZ5dPOxeJ12Zy9AY0v5Y9JcXLe2NoLcuXN1wG
         YjKxU+pkNhMTdjdgtQDBl53PR9Z7SYZEnwrqHX4n9nwvXY87zGEdiPw6P7iet+aySL0K
         iuWDRjO3p87DvY+s2FXSsiPLzUQvE18a1Rx19aGIohSyV0ZHzTdgiCEB/+GvYekjCoxt
         Jf2vhgLxnbGpTWdGvNotMYAwah4YJMRZUU1f9XWFf3aZ2371urcOKgcVVY8HT5TLHYGt
         RwVFQMRmvDeSpk4s70Ph61nTqHGZKp7qeaoXVd859t5emyIW7rJ3/kYwcVW/CZYSZCH5
         OnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ru2v+D3BKbQXHdK6oP95hVcWGBqQtKaZoxkk1jRrl3c=;
        b=Je5Zi7zK15Bkzz2+j3bR6JOBv5VuLJ8IeUOR3t1TTjJly3seTjfgDn34jvBWjYCAAa
         myjRQqZU5ZxRIky9Cg4cGw28PhsfUfHLo1M1T3cNcAICftpYq9/xms/RC4BWh2U+kOEM
         7qeTLmaFjrEpf+vA9k/7I92lXX26sQr13vFxOewkXttvngxLClj7Qrqa5ennY5Y0nBil
         vqcw+nSXv6wW4ghJYVEt2NPcqPPzKQ7XlIlfYPcOYVqp/FKvuAJcWGwrL7kUMMk1/mS0
         cx6a+WL43BmeltDOcf/GxGU1c19iiVf2TmIRptMsDJFgcccPFQ6JAx1Rt4/r2yn6SVBW
         Th+w==
X-Gm-Message-State: APjAAAVw1A6Upijp2XTWlunGtLeiDHDtZ/vG3wHINWP4nmRtrNK5qooJ
        LyZ0GxeRYHKZRi3j6nPGAo6OOQ==
X-Google-Smtp-Source: APXvYqzC40kwIHyJCN0QeAIgIN72Gz3Na3N0346y1z8Cs+IkEP1lODWimL7yqyqRjtmUhUim2iD4Kg==
X-Received: by 2002:a17:90a:ba94:: with SMTP id t20mr2124125pjr.8.1568953121564;
        Thu, 19 Sep 2019 21:18:41 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h6sm612459pfg.123.2019.09.19.21.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 21:18:40 -0700 (PDT)
Date:   Thu, 19 Sep 2019 21:18:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: glink: Fix channel memory leak
Message-ID: <20190920041838.GE1746@tuxbook-pro>
References: <20190919100540.28159-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919100540.28159-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 19 Sep 03:05 PDT 2019, Srinivas Kandagatla wrote:

> If we stop and start the dsp while channel is open then there is a leak
> in the driver as the refcount is not accounted for the open.
> 
> This patch checks if the channel is open while running cleanup code
> and does an extra kref_put to account for open which would ensure
> that channel does not leak.
> 
> Originally detected by kmemleak:
>   backtrace:
>     [<ffffff80088b74d8>] kmemleak_alloc+0x50/0x84
>     [<ffffff80081ddbc8>] kmem_cache_alloc_trace+0xd4/0x178
>     [<ffffff80086b8bd0>] qcom_glink_alloc_channel+0x34/0x148
>     [<ffffff80086b8038>] qcom_glink_work+0x3b0/0x664
>     [<ffffff80080c3da8>] process_one_work+0x160/0x2f8
>     [<ffffff80080c4198>] worker_thread+0x1e8/0x2d4
>     [<ffffff80080c8b24>] kthread+0x128/0x138
>     [<ffffff80080845b4>] ret_from_fork+0x10/0x18
>     [<ffffffffffffffff>] 0xffffffffffffffff
> unreferenced object 0xffffffc02cf5ed80 (size 128):
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index dc7d3d098fd3..38a10dcc2029 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1660,8 +1660,13 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
>  
>  	spin_lock_irqsave(&glink->idr_lock, flags);
>  	/* Release any defunct local channels, waiting for close-ack */
> -	idr_for_each_entry(&glink->lcids, channel, cid)
> +	idr_for_each_entry(&glink->lcids, channel, cid) {
> +		if (channel->rcid)

Thanks for the patch Srinivas! I looked at it in your tree as I was
coming up with the fixes for the problems I hit in my testing the other
day.

But, there is a window between qcom_glink_rx_open() assigning
channel->rcid and where rpmsg_dev_probe() will invoke
qcom_glink_create_remote(), which adds the channel to lcids, i.e. where
we would leak the channel. So I instead picked Chris' patch (3/6 in my
series), which will clean up the channel in this case as well.

Regards,
Bjorn

> +			kref_put(&channel->refcount,
> +				 qcom_glink_channel_release);
> +
>  		kref_put(&channel->refcount, qcom_glink_channel_release);
> +	}
>  
>  	/* Release any defunct local channels, waiting for close-req */
>  	idr_for_each_entry(&glink->rcids, channel, cid)
> -- 
> 2.21.0
> 
