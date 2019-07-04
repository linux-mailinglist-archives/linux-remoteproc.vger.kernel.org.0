Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16C5D5FCD9
	for <lists+linux-remoteproc@lfdr.de>; Thu,  4 Jul 2019 20:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfGDSWJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 4 Jul 2019 14:22:09 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37531 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfGDSWJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Jul 2019 14:22:09 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so107685plr.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jul 2019 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=49RKdZb8IIkI3+0BX8wWpyu8JU1kt+cg0DgkZkLzmHQ=;
        b=bxZiuhbvu7gj8r66QOfCt00uKvIwZGfRFI7lp3ObZkA0J8E7LZqzN7oVsp5hGVxHIr
         bxdHg4b6TP7BtDl2ZBoQdNlax8PghFlFmcysYTK/ju8LcoZ8m8m19UdonvTku9pWkgs2
         Iaa7US2TJ0WtgNgnBtbWdL7QZIQlg9jRN0LWoQpguW7/DBPGYG9j2k0bVSK0cP5tQLBI
         UP+ztfnbWV/kS18DUDIIq1Bw/ji+CYnftI3Au1MpqhLMEpThBe0N4ryRHnJNTKf76fWa
         GDndeDIp2DhbEYehzut1mQQ7WwnsyCVsOsv74wErEsiQz/r7a6hQ6kQLAwY6+kHfR3AD
         pXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=49RKdZb8IIkI3+0BX8wWpyu8JU1kt+cg0DgkZkLzmHQ=;
        b=rh2Y/OCo6KAmO7ILKRgjMXhCR91QqrD1cFDfWkfvHKW4d+BABUck9r01L6BLTcsuG+
         rK2LNfeMvzohHEfv9a4YtWZU1MGJppZK+pPrZKiqKUkWZMtuw5VCnoN8zLy5YXC7/Oyk
         2V8YigZawEDpKvdqVRrGr+Jxw+yHbfEzzDz8ivsHTxaXvNu4yn0c0bfsIrBHQ4XtxV10
         zJJyNSSSvoOjWFvm8E1zwyHygAjIIlnXAsI4qd5X2zw7R1+O2ieGXGVI2Z6ORfk2mv3W
         /919BPY602S0cZJUQmtXT/aiaG99RdG3kNZo6oUwIz9Y58cWfOWxtUqWr4Z8ZF6B9/Yj
         1ZIA==
X-Gm-Message-State: APjAAAUkWF2IlmFtUuUwMeE4YFMnI2FBv4BcWl3w57MRBgtgtJjhYfp8
        ugHj8FZkKTcyD9teC0zN2DZRDA==
X-Google-Smtp-Source: APXvYqwEPNKxrXbrR8Sdnw3wDwHG5QxDj+xW59knWJIH0vuARI+MCJ+AEmaVAbAb7mYceyZZ81YJ5A==
X-Received: by 2002:a17:902:ff11:: with SMTP id f17mr51796069plj.121.1562264528372;
        Thu, 04 Jul 2019 11:22:08 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k16sm6647443pfa.87.2019.07.04.11.22.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 11:22:07 -0700 (PDT)
Date:   Thu, 4 Jul 2019 11:22:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     ohad@wizery.com, jeffrey.l.hugo@gmail.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix build error without
 QCOM_MDT_LOADER
Message-ID: <20190704182205.GH1263@builder>
References: <20190704064649.51748-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704064649.51748-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 03 Jul 23:46 PDT 2019, YueHaibing wrote:

> If QCOM_Q6V5_MSS is set but QCOM_MDT_LOADER is not,
> building will fails:
> 
> drivers/remoteproc/qcom_q6v5_mss.o: In function `q6v5_start':
> qcom_q6v5_mss.c:(.text+0x3260): undefined reference to `qcom_mdt_read_metadata'
> 
> Add QCOM_MDT_LOADER dependency for QCOM_Q6V5_MSS.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: f04b91383456 ("remoteproc: qcom: q6v5-mss: Support loading non-split images")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for catching this, Applied.

Regards,
Bjorn

> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9b0f0cb..28ed306 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -116,6 +116,7 @@ config QCOM_Q6V5_MSS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> -- 
> 2.7.4
> 
> 
