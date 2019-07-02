Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0EA65C950
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Jul 2019 08:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfGBG1J (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 2 Jul 2019 02:27:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37751 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfGBG1J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jul 2019 02:27:09 -0400
Received: by mail-pg1-f195.google.com with SMTP id g15so5271420pgi.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jul 2019 23:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EuejUuvkcT0encYrvFlmXEqjXG50bA0a3JTt1nvk284=;
        b=SUrTPTpxZQWzoc8xTD8MV2EteX90mj48aZsU+pGX5yAGF16EQHrZQDK/GBKw3jOg92
         1SltWro5BRtXqRDHomNrtTRJ2oZiBRrcCOwyg0aIlmrqWCmamn/de4sTTkqz3wZwUzRw
         R6etkEFn4ZdfTuIAUnnVcR/5Sug0HdzBfRieNTsr1y4BqAhBL6Z+P/7beZC50k2P4Mvv
         dQkgsT/FzLFzuDl6hGrJYVnkXlxwFRt4vxDqUSO9SmBhllum7KPE8d1U02FF+ThVYkT3
         Tgii0iXStS3K6tuNl/Q3wX4FFk/5GzDN/CeQAq1pVbhJYIdY4pQsknE0xgHpcj0o5btW
         eyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EuejUuvkcT0encYrvFlmXEqjXG50bA0a3JTt1nvk284=;
        b=d9kiNofuYtNv68I/3sJbR1SdOg8AAzcpr7Pb5dAR4+SAJgpbq4Fpth96xeOj7CQb4w
         Rw6mXRnbsTngBJO+CoW8YiwYiH6sJj/+HNIwuu29Zsv+XGUyZ4TlpOpVKjjVilabdaqa
         vg2p94VJD8dnP6tFpd5i4m/zPtvGGq2T4qzzIJ8zYkA5M8ZJ6dkHr0jP56yJRxIMgMEe
         Vwf1Fk6JDD6Cq1HeZQyBLszXVTzurdaFik5OgFzTl7b88NfnU11/JXi5dUOUrCa3ss4O
         DV1D3KlH9+0D3UuC39xlWJLFfyu9MxgPkeGlXrF7dw/VK3+ZeCvvK6nqMSnTk1UvZmFn
         EXrQ==
X-Gm-Message-State: APjAAAX9WhlIS4RvJmTkQHEEP6QQ13UBZhjyQO2i3Q8skhPsZRVPsDRe
        E+GFafOWchFaZKbesM5YnqDPsg==
X-Google-Smtp-Source: APXvYqzn990jfIj5vkMAV1wfDm7OU+D+4BFoi7MQmUCzx2hStv2aQET+Y2RagVAIh/1G1I9NwHthRQ==
X-Received: by 2002:a63:6089:: with SMTP id u131mr29778864pgb.314.1562048828621;
        Mon, 01 Jul 2019 23:27:08 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm5644142pgq.2.2019.07.01.23.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 23:27:07 -0700 (PDT)
Date:   Mon, 1 Jul 2019 23:27:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190702062705.GG1263@builder>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701070245.32083-1-cleger@kalray.eu>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jul 00:02 PDT 2019, Clement Leger wrote:

> When preparing the subdevice for the vdev, also copy dma_pfn_offset
> since this is used for sub device dma allocations. Without that, there
> is incoherency between the parent dma settings and the childs one,
> potentially leading to dma_alloc_coherent failure (due to phys_to_dma
> using dma_pfn_offset for translation).
> 
> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> Acked-by: Loic Pallardy <loic.pallardy@st.com>

Thanks for the update. Applied

Regards,
Bjorn

> ---
> Changes in v2:
>  - Fix typo in commit message
>  - Add "Fixes" in commit message
>  - Add Signed-off
>  - Add Acked-by Loic Pallardy
> 
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48feebd6d0a2..06837b1f2d60 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = rproc->dev.parent;
> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> -- 
> 2.15.0.276.g89ea799
> 
