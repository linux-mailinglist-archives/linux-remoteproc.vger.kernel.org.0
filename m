Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB4EF5CAB
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 Nov 2019 02:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfKIBVK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 Nov 2019 20:21:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39629 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfKIBVK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Nov 2019 20:21:10 -0500
Received: by mail-pg1-f193.google.com with SMTP id 29so5270708pgm.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Nov 2019 17:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZZyXqsUd9+dkddEX8U8wSy6klIsP6Cc4yZhVPnl7Ois=;
        b=t+3gEa6Pe+F6YUpMtqcvNpP1drKbHQJ1EQTnoZNCZozisLMISKaWnme8V3Fetr3QhT
         orhdCd+cGFke0/C2Wu2+BMOV4KJNxr2SRwg95bgMYRyWOTDL0xVjlrLO74trEuuwvWOL
         grxZL2qU94vpYqG8IQH4F+WI8hou9Eh0MEQklgL9hD6XcMyfbfeg1ckPRSD48ghKwgTQ
         bOgo5yRH0GXu7yaHlXobDbj9ndPoL3WXtHjccwivS9nD2vfgJ11sFpQSvDu1AeczhY6k
         jnpwDWOQAvsRxb5B1ObwJyqq9Dt2OFB7NlPWk7/r6CTuuxSjuU8RG0WYcPUXFvDy2h8W
         zQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZZyXqsUd9+dkddEX8U8wSy6klIsP6Cc4yZhVPnl7Ois=;
        b=dh+nueTGOS1q9bW9EQhiEbglpWeYMqnIho96wn4LAV8nMXmJL53EH9huSNj4m7Z5Xh
         C+M69v9I2eQ+KTLVlBAPm9R7LrZY+Rj7oYUl4q9gjrZiU2h912Uvh/Er4UXufzxFGZ+X
         2l1U8TV5nch2abjFmOImPL/PfYpcWIk9Rkp03Si7NOzt+yW6IXe0MUOREksVGYEfe0N5
         ZbR7m0QZ9aejDCtErIn1wZTLwijJByEI1AW3WAmyaFLbNltDRuFK9cXqAS7N+VjsaGG3
         mVuDIGTn/GlFSuMFy+9cUmbenMe+l9/xQroW0neYWRbejNCD7rhTTURc+8wlm5fQ2y0M
         vh0Q==
X-Gm-Message-State: APjAAAVnkkYrprWe7MIxXSIcJ5kRKEN5Gfca/xZ3Srviuofda06atZ8C
        IAnwHUeZS0+x/OYDYHMKzdx2CeKbvN4=
X-Google-Smtp-Source: APXvYqy7zRqKn2y80awnfO5e03LwdZxJct6mWIU/pFm0Libb5w/y7DBI+XrpLChA1oHx0aj3gKA+uQ==
X-Received: by 2002:a62:7796:: with SMTP id s144mr15231012pfc.37.1573262467987;
        Fri, 08 Nov 2019 17:21:07 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e26sm8444078pgb.48.2019.11.08.17.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 17:21:07 -0800 (PST)
Date:   Fri, 8 Nov 2019 17:21:05 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: fix argument 2 of rproc_mem_entry_init
Message-ID: <20191109012105.GD5662@tuxbook-pro>
References: <20191017115952.13935-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017115952.13935-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 17 Oct 04:59 PDT 2019, Ben Dooks (Codethink) wrote:

> The rproc_mem_entry_init() call takes a pointer to a vm
> as the second argument. The code is currently using a
> plain 0 as "NULL". Change to using NULL to fix the
> following sparse warnings:
> 
> drivers/remoteproc/remoteproc_core.c:339:49: warning: Using plain integer as NULL pointer
> drivers/remoteproc/remoteproc_core.c:916:46: warning: Using plain integer as NULL pointer
> 

Applied, thanks

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3c5fbbbfb0f1..943af836fa0f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -336,7 +336,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  			return -ENOMEM;
>  	} else {
>  		/* Register carveout in in list */
> -		mem = rproc_mem_entry_init(dev, 0, 0, size, rsc->vring[i].da,
> +		mem = rproc_mem_entry_init(dev, NULL, 0,
> +					   size, rsc->vring[i].da,
>  					   rproc_alloc_carveout,
>  					   rproc_release_carveout,
>  					   "vdev%dvring%d",
> @@ -913,7 +914,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	}
>  
>  	/* Register carveout in in list */
> -	carveout = rproc_mem_entry_init(dev, 0, 0, rsc->len, rsc->da,
> +	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
>  					rproc_alloc_carveout,
>  					rproc_release_carveout, rsc->name);
>  	if (!carveout) {
> -- 
> 2.23.0
> 
