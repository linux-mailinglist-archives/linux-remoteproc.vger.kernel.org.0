Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC60154CD8
	for <lists+linux-remoteproc@lfdr.de>; Thu,  6 Feb 2020 21:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFUSb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 6 Feb 2020 15:18:31 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40742 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgBFUSb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 Feb 2020 15:18:31 -0500
Received: by mail-pf1-f196.google.com with SMTP id q8so10811pfh.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Feb 2020 12:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DFN1Km4dCQkq+GGDV1xBpaMwWsOvVlBXIU+KU1SLC/A=;
        b=H0XeMD+6iXBq9rEwF2gPODpAdg7UWIGBJwq+XhYAMmhdeZK7LPstfFxROA6MwmBBI5
         FbSSsifLyu2EKf+pzBKjbm4GgsS8kE//QjYl8OgteVwPzJSQ2ZnYETTxJ82hMHli9Kn0
         G/oovqUZhD8W4nl3PmX651ZoKidu2pxfnVltxCWwcaAB8W98heEjoB6LDmQLakjPJXH/
         pHVUEagfwfWpQgtbqRxS4rTNDkkCySUp6CKmIgyEsF6yOBeygw0Mbyn+udmfHiHRjBtl
         0zwUavbb4UeZ14UwzO+qo4JgGq0EECucDU++DamE8lml01QYSgwmKxY1Uk/rUQy7/DGL
         YoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DFN1Km4dCQkq+GGDV1xBpaMwWsOvVlBXIU+KU1SLC/A=;
        b=r57GfEer/F1TfBCoJjTsg54RralQWJmlEnSr2KgGXMdWDuG/64q6Q+6Qljqe/Jid/t
         k9sluGhjcz+3ne02NOFTHDEgtzZ8c8vx3/VP6gQcWH/PoEJQ8VSPSIMrWHOBJgZ+8JJP
         8L8bxog/NqjdeiUrtdtCNuYAJbn7wbvo8KUBv/ewjLpvGMyrRg6oPXnrXwLGAckF7KoM
         lsz7HuKtFkXfAbvjeSy8pjzys+bb1iwDyGnoHokbh+lF6E1+676JF3lSiuT/Eb4oF4mz
         evUBmGpTkO4hvUQZqSL1ux26YMvYhkmKSfMye9aisjB7Bbt4iIqHPndXRtxbY5NAk1hM
         qOwQ==
X-Gm-Message-State: APjAAAXIXHd8ngiqrdktL0SFayBGa15yIyVJ/k9GZubUgwmDz8+l+x1S
        dnssghsdzAI5YxCSBZlZy+N5lg==
X-Google-Smtp-Source: APXvYqzPIpbi0GjjDSfp7TxORTZt+Q5S10BztoYv26HU5J8IWsGhIVrLNsL4619q3ubPEAMBo8kv8g==
X-Received: by 2002:a63:3688:: with SMTP id d130mr5660071pga.422.1581020310775;
        Thu, 06 Feb 2020 12:18:30 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b130sm265441pga.4.2020.02.06.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:18:30 -0800 (PST)
Date:   Thu, 6 Feb 2020 12:18:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nikita Shubin <NShubin@topcon.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: warn on kick missing
Message-ID: <20200206201827.GP2514@yoga>
References: <20200206055419.15897-1-NShubin@topcon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206055419.15897-1-NShubin@topcon.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 05 Feb 21:54 PST 2020, Nikita Shubin wrote:

> .kick method not set in rproc_ops will result in:
> 
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference
> 
> in rproc_virtio_notify, after firmware loading.
> 
> At least a warning needed on attempt to call missing method.

Is this not a fatal error only happening during development? In which
case the NULL pointer dereference will come with an oops with sufficient
information to pinpoint what's going on?

Regards,
Bjorn

> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..77a81f331e3f 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -32,6 +32,12 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
> 
>         dev_dbg(&rproc->dev, "kicking vq index: %d\n", notifyid);
> 
> +       if (unlikely(rproc->ops->kick == NULL)) {
> +               WARN_ONCE(rproc->ops->kick == NULL, ".kick method not defined for %s",
> +                       rproc->name);
> +               return false;
> +       }
> +
>         rproc->ops->kick(rproc, notifyid);
>         return true;
>  }
> --
> 2.24.1
> 
> Confidentiality Notice: This message (including attachments) is a private communication solely for use of the intended recipient(s). If you are not the intended recipient(s) or believe you received this message in error, notify the sender immediately and then delete this message. Any other use, retention, dissemination or copying is prohibited and may be a violation of law, including the Electronic Communication Privacy Act of 1986.   ??
