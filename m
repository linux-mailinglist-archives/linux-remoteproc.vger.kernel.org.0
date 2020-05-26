Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE77319E03B
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Apr 2020 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgDCVSj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 3 Apr 2020 17:18:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41479 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgDCVSi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 17:18:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id m13so155320pgd.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wh5T6yPyoIGG+Zj0KpPrWCt6Ri24iIgqMcr/FSjIJjo=;
        b=dQEiMd49xF9NMr54YPZPEh4RazLTQFxG6S/9P9F88Xuirh9ym2aWmtBdghXexh1frW
         z/rgzY+sOVKm3vlHmNr71rvnMGgJRvyjZQYdHQmMI+CtLIVqT+r4WtrEpKhgXGQXZwnA
         AOyQ+znPhKYs1ui2r43DlnnZ7xfyeaDB4uXqdvuTQG+aTdxydM1S1InyhLvsRaVLxMkT
         vwjfTQB3iDUix3tGh22PHsg3qYgYNHJ4ePCmqZug/IzvED7jgumdbep2Cvgil7y0lxC1
         6vQrzBFEzlPxDtZpLVT70OjLcwAxbRdmnuHcF6towIOeUCmYRxnFMG6kmapOOYAyskBM
         NkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wh5T6yPyoIGG+Zj0KpPrWCt6Ri24iIgqMcr/FSjIJjo=;
        b=C11GvwYPedsB6EP/9zkHM8b0iuqlSQdh7EHcN6n/DFrWS2FWYDeb5+qPuKvyniHdIP
         BBg121HZXfOl62QUmqY2HsHUHP1iyetbRHyLJjZGJRvhGnJPu8SmYTHG+uI7FTM3pJkr
         L7+34FKK6Oboea0JjRcl2fJzMU5EsCgMFRtdVWPCETQbz/htJTHDMVuA7kBw3moLWMP0
         21z7+3yN7PSbcOqClMnGKCaY9K6T0VMrd2rsrBWsR2YIOlLATf2FT+JvRniLrJSe12v4
         jElqArEC3tO7F9PnEPMK9zeb55HJakWIBqVVPq4o3K/F2NieVo659nlXosNRXoIVbwFh
         UjNA==
X-Gm-Message-State: AGi0PuaS1r+MY/zFLyNO5etVfCFa2kCMBAJszmIqeG4Cuv3+a08Rvx4i
        FVdulKGhrS2JKRs90h+spvOsLA==
X-Google-Smtp-Source: APiQypJXDWUKp+Nep+BHCEq3Oh0B9wkDEQHXI5BOrNimox2vgXjNvj7+clayV+Yw4Dt6ILYEscXZRA==
X-Received: by 2002:a63:a052:: with SMTP id u18mr10351993pgn.210.1585948717780;
        Fri, 03 Apr 2020 14:18:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y15sm6406323pfc.206.2020.04.03.14.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:18:37 -0700 (PDT)
Date:   Fri, 3 Apr 2020 14:18:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in
 omap_rproc_request_timer
Message-ID: <20200403211837.GC20625@builder.lan>
References: <20200402010812.GA751391@yoga>
 <20200403013134.11407-1-natechancellor@gmail.com>
 <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 03 Apr 10:48 PDT 2020, Linus Torvalds wrote:

> On Thu, Apr 2, 2020 at 6:32 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> > Enable autoreload in set_pwm") in the clockevents tree interacting with
> > commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> > usage") from the rpmsg tree.
> >
> > This should have been fixed during the merge of the remoteproc tree
> > since it happened after the clockevents tree merge; however, it does not
> > look like my email was noticed by either maintainer and I did not pay
> > attention when the pull was sent since I was on CC.
> 
> Thanks, I've taken this patch directly into my tree since it was my
> merge that screwed up.
> 

Thanks Nathan, Suman and Linus.
