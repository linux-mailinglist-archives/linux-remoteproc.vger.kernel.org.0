Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9864A75EE
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Sep 2019 23:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfICVHn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 3 Sep 2019 17:07:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44623 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfICVHn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Sep 2019 17:07:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so9887257pgl.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Sep 2019 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vC5iA0bQsbGKHyeKcPI7gPcJFZDzY4mLs43Aq/+9Tik=;
        b=HchqMEFk8+5F9xV5oyWGTZDa6C4y79p3FWN4sLDb/LwG1ZPoPyup9gXWI0jqKjpMPj
         IyTezlwsToG7IzfOKQkE0Kt/N4rij2tPUfTCBvk0IKQU9giEtoVGyQkThfIGhOH70fvv
         GJ6zQis/rr1HCRcQpf4VnzHhmPGJ6nZ35VBDN1egClJyM7U3aOxLn+ffGqU+MhD5iB1f
         NXqeDjORIQGx05GOnsGQ/jmft/IYLCyRB7GE5vpuAH4yAyFhxBhNYV4N9dPhIAM6RyFM
         wiNbs1P0+msoJL3uVw0cLE7D/4GxGdT0t3lvjFU51YIegtOMEm23p8YeIrLu0UNYy5f7
         tcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vC5iA0bQsbGKHyeKcPI7gPcJFZDzY4mLs43Aq/+9Tik=;
        b=QqOLA/F/qbsxgiFwP6aRsWhlrVEqslheXSnQvBr17YiAohh/yHrh6DkqyznA6wNgCz
         39+6UYDRzUuzpRrqTiaXpjrLRdhWEEnDWm4CeVMTqssYicKO+g+FowAWr6GSFzaADvuT
         vD3Ah1nhx1ZdZ7ktcSb78WxS3MTI/0qRpssLIgXiB7e6rgFwbh2JOQYklZjiZcV3DjJG
         oAUKnjMAzXiBNzqKwbJ4CC6dspNen9CxK1vtFrJf1mD6Am0DNtKl5JTcfQliNtCzNBJd
         WJTZZK3Nt7kHYQIvnVKDfckAN1UmL05VHGKC/f0dIRmOx9+AVbQMFRh9o9YzdKwFyyqp
         4Nqg==
X-Gm-Message-State: APjAAAWiow5XouglUiRPS+0bvmrFCxZvIAKCrBzfi1zZ6tYRpW83V1is
        CoM4wpCCWQLKuUWMaxKtLfaT7Q==
X-Google-Smtp-Source: APXvYqxpWDYjlQ7HP5zqOy8oYtw2mwWvQ55CkeJud59Die7cmaNGXUSUGX0/WbXfo753JzRYQVkqGQ==
X-Received: by 2002:a62:6045:: with SMTP id u66mr41471485pfb.261.1567544862502;
        Tue, 03 Sep 2019 14:07:42 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k8sm15646806pgm.14.2019.09.03.14.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 14:07:41 -0700 (PDT)
Date:   Tue, 3 Sep 2019 14:07:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org,
        Loic Pallardy <loic.pallardy@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: don't allow modular build
Message-ID: <20190903210739.GW6167@minitux>
References: <20190902200746.16185-1-hch@lst.de>
 <20190902200746.16185-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902200746.16185-4-hch@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 02 Sep 13:07 PDT 2019, Christoph Hellwig wrote:

> Remoteproc started using dma_declare_coherent_memory recently, which is
> a bad idea from drivers, and the maintainers agreed to fix that.  But
> until that is fixed only allow building the driver built in so that we
> can remove the dma_declare_coherent_memory export and prevent other
> drivers from "accidentally" using it like remoteproc.  Note that the
> driver would also leak the declared coherent memory on unload if it
> actually was built as a module at the moment.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Please pick this together with the other patches.

Regards,
Bjorn

> ---
>  drivers/remoteproc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 28ed306982f7..94afdde4bc9f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -2,7 +2,7 @@
>  menu "Remoteproc drivers"
>  
>  config REMOTEPROC
> -	tristate "Support for Remote Processor subsystem"
> +	bool "Support for Remote Processor subsystem"
>  	depends on HAS_DMA
>  	select CRC32
>  	select FW_LOADER
> -- 
> 2.20.1
> 
