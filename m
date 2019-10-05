Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46FDCC797
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 06:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJEEBo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 5 Oct 2019 00:01:44 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45559 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfJEEBo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 5 Oct 2019 00:01:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so4034628pls.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x5hylgRMeRU8L9fHC/1Fb4E//rkwEdbksV9F9/mIRbA=;
        b=ZL7XnJSQG3L3uQDFU4czS6QDWOm9UGODjWe8twIXjS5XOj1lqsERlLXOaoDIskWGHy
         6z/Yzl09u40RoGg6/DCOkTTjF7lInbF2TxUcC+T5yOmiAEj5FKYFD/o/Qv9gQwrXS58k
         JQgHmXH4W8zDjaGy8RSBw6Qc3w/bz/QINI7yzHkQJQ9loIb6Bhq7nWT77w/93ft2RKAf
         2XeffjCIgE4yaQLDp3/l/RR/3gpii0MEEisdFjwkwaxU3g1fVr82cbaA+jZan2I57qNm
         sMjR/wxk592/TM9Gkp4YJbWYbTizqQBa0gkDJKniwRn+wal86zZFwUemuzGKQ88QRnPC
         dXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x5hylgRMeRU8L9fHC/1Fb4E//rkwEdbksV9F9/mIRbA=;
        b=qZbLMA72M7+18h8evzr+XSfkw+TdREuTAxJ9tOWxwAdyp6PDKoWAvVd/8DdHShDpN1
         lFDr91KBi7eVvdySwyKkBEEn/2/W2+cvDukNwHGs72qgQzH2Olsjv+rwrwAMX4dYDknr
         XyX5OrQwBfsxm/AY2LnnmSbC3QNCRnZ8hQO/5JgyFWa2TRM9zO52sPD7PPofMrvxcXkc
         WW/t8NqhFcQYMnNPb0TL5uvP7/DA/iD8PcgZM/48stRzj9kv0iz4Sf1Q+0PziCe/jznS
         Ii/SZHnaCXJtaVfQUujrCyYyD2MskBspfAqhxzBQLHVpyn7+DOLXpRaDPBmpXp7QJVp7
         XDSw==
X-Gm-Message-State: APjAAAUYVS9iCU1ASwK6jS2iMw1g1d1561gdGrBn2s7b1TG0p6OOfIrS
        XFKadHMNlX+TKCVNO6DO/Ohtzw==
X-Google-Smtp-Source: APXvYqwtVfC9awsCX31ooNBVQ9ZPETZdMu5K40YYblKAeEdWHBXOtuqnI4Fa/lwyS5uv0R5M4KJ3+A==
X-Received: by 2002:a17:902:bb89:: with SMTP id m9mr18180654pls.315.1570248102165;
        Fri, 04 Oct 2019 21:01:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f12sm6064016pgo.85.2019.10.04.21.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:01:41 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:01:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     linus.walleij@linaro.org, ohad@wizery.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Optimize the u8500_hsem hwlock driver
Message-ID: <20191005040139.GA5189@tuxbook-pro>
References: <cover.1569572448.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 27 Sep 01:27 PDT 2019, Baolin Wang wrote:

> This patch set did some Optimization with changing to use devm_xxx()
> APIs to simplify the code and make code more readable.
> 

Applied, with Linus' r-b

Thanks,
Bjorn

> Baolin Wang (3):
>   hwspinlock: u8500_hsem: Change to use
>     devm_platform_ioremap_resource()
>   hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
>   hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register
>     hwlock controller
> 
>  drivers/hwspinlock/u8500_hsem.c |   46 +++++++++++----------------------------
>  1 file changed, 13 insertions(+), 33 deletions(-)
> 
> -- 
> 1.7.9.5
> 
