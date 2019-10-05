Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D16CC79D
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 06:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfJEEES (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 5 Oct 2019 00:04:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46801 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfJEEES (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 5 Oct 2019 00:04:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id q24so4029522plr.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 21:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OjGNki1OtQEb9lfJ7oq86arnt9zKkyVmO56fkHyMMNA=;
        b=Pp6cHGV1T9C8JGOPqZ5ZlA9zXuRKxXrYBXa6Q2bspKkZUoX386pJe8QJw46fHhziqm
         8j/2teWNFBYM2iCiHz7ob8qRgIdwmV7GC3BZx3x69bactMZ8RjbBVdKIZPUo1w5m5ps4
         ejo/g6edELC3BDyPX/gbtLItFz+PLvNDxaJu687yKIH4PJwSGkl6kFS4jDU14ykmX5nw
         6APu1NGSXU+hNcwJXnyikT+VUBu06OGpl4nyvonvmsNDZsTVz2edgyqHWFT2TUzfqPgj
         JFzpk626GQUK+YX/orjIwdxS80DqzXyIyuHerWR8I/nDx5vWN+mzZa8ki2K3ekV3nK/a
         Wbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OjGNki1OtQEb9lfJ7oq86arnt9zKkyVmO56fkHyMMNA=;
        b=potsPVCgZfk4IENsqOfX9EDo8vdwC/7x7nAfZqY6j+magyKlF2TaMeSolt1RQlcMYK
         Eg1g/kAMdreJVQ5WVlWVuM8SkqlU/n1/9nNE6QT1hgUbSLRJ42tth6AXZpNDqLqPnCzS
         lwETIgXL/XhcqXtNf9ZHREDeAPf1E1/oobH29H6fAiTNkwP+5q9K9UCuQ8jAmy6OTVkL
         YGkEdn2xaj5iaSzzw9ZKcJhCA77hY8z17bDGgA58X3jTVgbenk9+pc+nJILPFRKsxLlq
         VG5PmaLsF1Z1d5uUtYE26W2Ao4PZ2wvzxGG84jlW9KwOx0rK57QISU8rREddIsLMjj4a
         CJ8Q==
X-Gm-Message-State: APjAAAXMMI6PQj2o1/hDKh+k5Q2OpauVxKaomVyTxw6yAI2Fp+f77vui
        8sVSPRPPTJ48jTTimEjBxgOP6uop4gs=
X-Google-Smtp-Source: APXvYqzY08m6btRbimG2q898DgnjetYaB0eC4YSy8klHl9oR6CrMbJJ7A0hsMqeg/pYeKNIZosDu3g==
X-Received: by 2002:a17:902:d896:: with SMTP id b22mr18251348plz.140.1570248257806;
        Fri, 04 Oct 2019 21:04:17 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r24sm7824649pfh.69.2019.10.04.21.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:04:17 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:04:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remove useless typedef
Message-ID: <20191005040415.GC5189@tuxbook-pro>
References: <20191004174424.21898-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004174424.21898-1-cleger@kalray.eu>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 04 Oct 10:44 PDT 2019, Clement Leger wrote:

> rproc_handle_resources_t is not used anymore, remove it.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Applied

Thanks,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48feebd6d0a2..78e00194e72f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -52,8 +52,6 @@
>  static DEFINE_MUTEX(rproc_list_mutex);
>  static LIST_HEAD(rproc_list);
>  
> -typedef int (*rproc_handle_resources_t)(struct rproc *rproc,
> -				struct resource_table *table, int len);
>  typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>  				 void *, int offset, int avail);
>  
> -- 
> 2.15.0.276.g89ea799
> 
