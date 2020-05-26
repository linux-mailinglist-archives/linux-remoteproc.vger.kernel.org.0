Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C4B1C1C66
	for <lists+linux-remoteproc@lfdr.de>; Fri,  1 May 2020 19:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbgEAR7l (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 1 May 2020 13:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729264AbgEAR7l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 May 2020 13:59:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F1FC061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 May 2020 10:59:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so1877741pfa.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 May 2020 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SrJ+suZtBWr1oaesi/k2ktaEJnaAc56s/fpYYwm6YkQ=;
        b=rtUe86ofD35Jm4kswBmEsEiDvYps/sFLvc+ucRqtIMN6Wg3XEGcRYzZyWhpnEWffql
         I3cAVYkpNiJg9tmvu7bXzxraGLxCbRGRO4ZxtZkJohoMaBUoJdbTCyYKximei2dOynJ3
         hxG6dZLTt74LX5VnwHPk1A1McsjT/SzfbUN1AkGAUJMPYcY8CHlx5nZ5z7wEiqkT4tU6
         ArTfBHszH1/lrdfolV+z/4bLsFO7PgN+KXYar26fPiH2TFLda7soTzqU5Ks1iXxpQ7Xl
         lhRMVyBkTCHNR9RhjR++rAN8EYAFapQFr+yPZ2+hm8nhAtuoAAUy1pE5YWIx7KXTNgj1
         Q2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SrJ+suZtBWr1oaesi/k2ktaEJnaAc56s/fpYYwm6YkQ=;
        b=Jd62qGRR/C4ISu5dKzeF7K6jEPg2tH+ME4YmGcGfletL3VuAD7FK8OrtxJdVdY+VXA
         o0Y/yDGhUQeykTSesSAkfy+VCbxGDDa8MMlKTirCdzGZnAYuymmxF10weQ0M9WZnH3Yk
         SIkzMxYCScjglclWIdhTShMiYoAzYv+EAtGXtvzRWKtMgfEuvuVI1UNedPaj2yr+CHGU
         SwBtg0v92oddhbV92X+65ke0NYGKj3H3DD2FBLA30yJDvqxrnrw/lfDR+y9zs4eYsLth
         QeVtIRhA7dBqccnwbaEB7UJn8CQCvgHOJ0lEe9qd8zcKmhE0MrcbPMS69UZ8gAKyjNMi
         4xWA==
X-Gm-Message-State: AGi0PuYd5JIfSJcmyrY9wQbltjC4HECckDCNEOermrG7MOv8SUeNgRTv
        wF6XmpS6w1m+yTe7IzpG+IsjIg==
X-Google-Smtp-Source: APiQypKSvb3juH8yufYz3pZtYJr5I7jYwQqi+KNzHP8QMg+pl6CzWIz0QI5ety/mLdAJyEKbW8lq+w==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr5189526pgv.174.1588355980303;
        Fri, 01 May 2020 10:59:40 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e16sm2510386pgg.8.2020.05.01.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:59:39 -0700 (PDT)
Date:   Fri, 1 May 2020 11:59:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] remoteproc: stm32: Add support for
 synchronising with M4
Message-ID: <20200501175937.GG18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <219771d3-b0a5-0ec7-7f20-d2055bcb0217@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <219771d3-b0a5-0ec7-7f20-d2055bcb0217@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 29, 2020 at 05:08:32PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> > This patchset needs to be applied on top of this one [1].
> > 
> > It refactors the STM32 platform code in order to introduce support for
> > synchronising with the M4 remote processor that would have been started by
> > the boot loader or another entity.
> > 
> > It carries the same functionatlity as the previeous revision but account
> > for changes in the remoteproc core to support synchronisation scenarios.
> > Some RB tags have been removed when the content of the patch has strayed 
> > too far from the original version. See patch 3, 8, 9 and 12 for more
> > details.
> 
> I reviewed the series, and made some tests on my side.
> FYI, I do not answer to patches when tagged "Reviewed-by: Loic Pallardy" 
> and with no extra remark. So consider them as Reviewed-by me but not
> necessary to add the tag in commit, Reviewed-by: loic in commit is sufficient. 

Well, if you spent all this time reviewing the code might as well get credit for
it...  And it also helps maintainers get a feel for how many eyes have looked
at the code.

> 
> Concerning tests, it works find except the crash recovery from a sync start.
> But i suppose that you know the limitation, waiting Loic patches[1] update :)

As I commented in the patch itself, I'll fix this so that the condition leading
to the recovery limbo can't happen.

Thanks,
Mathieu

> 
> [1]: https://lkml.org/lkml/2020/3/11/403
> 
> Thanks a lot for your work!
> Arnaud
>  
> 
> > 
> > Tested on ST's mp157c board.
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=277049
> > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> > 
> > Mathieu Poirier (12):
> >   remoteproc: stm32: Decouple rproc from memory translation
> >   remoteproc: stm32: Request IRQ with platform device
> >   remoteproc: stm32: Decouple rproc from DT parsing
> >   remoteproc: stm32: Remove memory translation from DT parsing
> >   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
> >   remoteproc: stm32: Get coprocessor state
> >   remoteproc: stm32: Get loaded resource table for synchronisation
> >   remoteproc: stm32: Introduce new start ops for synchronisation
> >   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
> >   remoteproc: stm32: Introduce new parse fw ops for synchronisation
> >   remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
> >   remoteproc: stm32: Set synchronisation state machine if needed
> > 
> >  drivers/remoteproc/stm32_rproc.c | 262 ++++++++++++++++++++++++++++---
> >  1 file changed, 244 insertions(+), 18 deletions(-)
> > 
