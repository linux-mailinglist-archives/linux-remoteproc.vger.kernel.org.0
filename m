Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67774180B83
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 23:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgCJWZq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 18:25:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33267 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgCJWZp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 18:25:45 -0400
Received: by mail-pg1-f195.google.com with SMTP id m5so77662pgg.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2020 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+SMw3KzwW0qIsxOajP3cV8dZM1F0dvmhCHxZU/Nkvn4=;
        b=kXz7NuyqUXk06IqGmoTk11IMzDW5AzrbJi35Fg7DHg8FyMNbD2e7cBObxGFy6GQFaZ
         dbNZPDzIsV9c6hMAlwZKh4x5bUKzT0J7VK/vU68bKIga53ppfumHvMB5M7I9GByTA+E0
         usgCHNvznKWBrJNV+rJDfZjjITw4IHL+w5b86vHZ8EhxRJnCyFJCGMHuJvrlFaTY2Fvv
         o2lIdi4kOS1rtjP7m8kRlSBig0jyNKN3ISii8t4Iv1RSoyNziWIZvqJG1OdTckQX2LN/
         IGer/J6Jg9aoAZPgRZcw0PbwTw7bNUHUATwHip1aKHSA2JlD9GvveB7fJDj+RESHDNTV
         q2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+SMw3KzwW0qIsxOajP3cV8dZM1F0dvmhCHxZU/Nkvn4=;
        b=uHQ3U74VQdcpMKmhIi0cqBW9avURJfZBnsC275x5I5jlwQiTW5y17PdoMY0euaEIEX
         6aKqBIfWSpYdARNxRFO1NoDwbdPEbYQwbcPpb2lqj1TMLMGWYy5UvlyxsCvTOifeebaA
         cJizJizKER+yzx9I1DhXk0fS142tuYZP7r/xkTAli11KMLQOQ8bxZcTpJY/+fgD6QIyt
         GoGNdRzfQuq6zq0lffhEoZI0nRPLqroMtbmnipt2KGO9FxGgSAUsi/rlTNQTCI4/1SBr
         C2UjwIJ3JeUueRtKMags/19AprvbioYBEe+VefuYuS69OrJzbSPBtJRQRV2Zl0GnYOGX
         XKog==
X-Gm-Message-State: ANhLgQ0CPUqumhUheLvtFN6S5DiR2hDwiVf/W0+5R7YhtsmOybNPZhWh
        c206ki/moKa+5I5HqxqqwnYI5Q==
X-Google-Smtp-Source: ADFU+vsP3GEkD/yGCbjWZr9amUrSp8lGkyIkcahbLxq5xe/LUQjUc2fdKy0+00IllBQ6HMvbgl29QA==
X-Received: by 2002:a65:5905:: with SMTP id f5mr21428215pgu.87.1583879144413;
        Tue, 10 Mar 2020 15:25:44 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q9sm47191418pgs.89.2020.03.10.15.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 15:25:43 -0700 (PDT)
Date:   Tue, 10 Mar 2020 15:25:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] remoteproc/mediatek: Use size_t type for len in
 scp_da_to_va
Message-ID: <20200310222541.GG14744@builder>
References: <20200310211514.32288-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310211514.32288-1-natechancellor@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 10 Mar 14:15 PDT 2020, Nathan Chancellor wrote:

> Clang errors:
> 
> drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
> pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
> 'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
> expression of type 'void *(struct rproc *, u64, int)' (aka 'void
> *(struct rproc *, unsigned long long, int)')
> [-Werror,-Wincompatible-function-pointer-types]
>         .da_to_va       = scp_da_to_va,
>                           ^~~~~~~~~~~~
> 1 error generated.
> 
> Make the same change as commit 0fcbb369f052 ("remoteproc: Use size_t
> type for len in da_to_va"), which was not updated for the acceptance of
> commit 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183").
> 
> Fixes: 0fcbb369f052 ("remoteproc: Use size_t type for len in da_to_va")
> Link: https://github.com/ClangBuiltLinux/linux/issues/927
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied, thank you.

Regards,
Bjorn

> ---
>  drivers/remoteproc/mtk_scp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 7ccdf64ff3ea..ea3743e7e794 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -320,7 +320,7 @@ static int scp_start(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *scp_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
>  	int offset;
> -- 
> 2.26.0.rc1
> 
