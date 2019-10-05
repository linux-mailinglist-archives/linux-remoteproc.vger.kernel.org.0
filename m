Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F00CC7A3
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 06:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfJEEMM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 5 Oct 2019 00:12:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45971 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfJEEML (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 5 Oct 2019 00:12:11 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so5046620pfb.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 21:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tDHZY7i0iziEELzVvxjqEm4cMO1oJyX/TqJTG8MncDg=;
        b=UPKPu6nDI5XZ9uTUtEwlP++RWapEu7sLryWy6tCdsxYHzissWIHoJvw7OunllnzsI0
         Fes1SNsHRK6F9GjLIpw4lLQ+VViQOfjSP9+TFRXVEalhCzESQzgWXOH+RhP6TMQsYa33
         DMZw6lwW6+r808ZXFPTdxFryomDOgv7XXRizBZ4h+kNoUM0JMfNkAeJ2JvKKs21sqCZU
         ZJTfJtafPPkhdGM9AQegnQic+jFTqOHg30eUlNOyJuzEbLZymKwi4xDz3GqKmIeD4vbQ
         U7hwDsxMDCp87jm1JNJ45UbYMJiaoACncCOriJh7PrThULEdhtneq3UmWJNowvu8N6KU
         8Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tDHZY7i0iziEELzVvxjqEm4cMO1oJyX/TqJTG8MncDg=;
        b=EQQiWIeTCXPfnBBGLuP0vulbp6r0nGmn+FhVvuFqFYR6IFvOBbOVwM/LZVxKgwScDx
         WM7G1x08+Dj84O/V2vrynkI5f/KPKGhJ+IiMNkRm0SlmJ6FsQ9CAGAj9WBtZcW7MXGJj
         GnbTNvxdJczFnCrJmX8zRYEViZ7aoC/YVHiDzYMMwjoKtp9mjP1d2GNAs6l6NajP05h+
         bJHJ4AUceCj3f8+z25VgtPC/N8Qa7ZvJSL3uIAVgg+bWP2YICAnccmDcdsg9NBD+YnUI
         8GHGqdqLj99cLOkl/zL/uVBq0PRjfO1TYA0kP5J+UG+O4+k/QnGFkyaDt1MuHyPiatzV
         bghw==
X-Gm-Message-State: APjAAAUkSsV4B62C1qsOaXFGNESlz4UNvKcyThmsMsuflHQw4WT/dFCT
        VjSEdzYxpFVIdPopZTwNTWHzad3NHeI=
X-Google-Smtp-Source: APXvYqwDeF6E+Fovx/kwk+nnBJeWviqZdubVrtEeOznS/FjWQiJA1r0rVtuOGIKn7exk+jjcR7Glhg==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr20517130pfn.1.1570248731163;
        Fri, 04 Oct 2019 21:12:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e10sm9645914pfh.77.2019.10.04.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:12:10 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:12:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: debug: Remove unneeded NULL check
Message-ID: <20191005041208.GE5189@tuxbook-pro>
References: <1569293934-31451-1-git-send-email-dingxiang@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569293934-31451-1-git-send-email-dingxiang@cmss.chinamobile.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 23 Sep 19:58 PDT 2019, Ding Xiang wrote:

> debugfs_remove_recursive will do NULL check, so remove
> the redundant null check
> 

Nice, applied.

Regards,
Bjorn

> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 8cd4a0a..dd93cf0 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -333,9 +333,6 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>  
>  void rproc_delete_debug_dir(struct rproc *rproc)
>  {
> -	if (!rproc->dbg_dir)
> -		return;
> -
>  	debugfs_remove_recursive(rproc->dbg_dir);
>  }
>  
> -- 
> 1.9.1
> 
> 
> 
