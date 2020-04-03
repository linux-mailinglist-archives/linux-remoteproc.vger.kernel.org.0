Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC2219DD11
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Apr 2020 19:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgDCRs2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 3 Apr 2020 13:48:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37375 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgDCRs1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 13:48:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so7836973ljd.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3THBIeg1DeeQfa1qWYP5fMgyz8PG9WZarWEKIAjybzc=;
        b=N9neCI5Qjc956nHzpT6Wv66wmcCPHy18i498AuxWNSpHcXpezXTuTKm2OG1vKqL42o
         JtGfih0oxhGl0Bq1LQLwJPruvqzhW2QlyHd3ffmbTf6kYcGwiNvs1B3JlPdeCUi9ce4q
         vhAhfkqRxPVn0NCUVrvl0tZmhQSEnzqjCiCsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3THBIeg1DeeQfa1qWYP5fMgyz8PG9WZarWEKIAjybzc=;
        b=UiGv8ceqIXOn1hNQAgGbr7MZ3JfejrFHelZll+JoSa3uufcbLY3+NUlZmImi679v5m
         gRmhThYtUgoV9tdw6GyApxnjmAUzrWIbzuwz+Xsul/HIn6mnfQPkTfU7NaMKoHxpLxrf
         c0r5N/h7/B8oclsIiWGgAWiJj7UVmp0c8daw5UiUI22ITPc44N4i4CBNttm/r+m/xX4U
         S/nClyLktf7MHFwNbz+I7+L2dzTii8mdH0foUOop6s2GdIl+D66XJkEt1V9gGaa9zYZ+
         /fa+Wlt2/kc+0bLyZepP5ScL1MnRHYljXOltYhVfDofZC0fV4kyBwQhW2NpTZpo5ZN8a
         Oo9A==
X-Gm-Message-State: AGi0PuYWVHoRqgbpRksnWmNfXUZ+MdJH3TKVt5K4lQebgdhvb8kT4qF4
        D0aWPAETGtxyM3FEoeRN+0nkSZb5wEc=
X-Google-Smtp-Source: APiQypJ4sntj5ONjhMBpOEdafTIshBrShw6Y0hOkjEm4gjEUMBmhvmJJ74Q3BGQC0Hq9XfZbcdjYig==
X-Received: by 2002:a2e:9d85:: with SMTP id c5mr5442445ljj.168.1585936104240;
        Fri, 03 Apr 2020 10:48:24 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id a22sm5287808ljm.28.2020.04.03.10.48.23
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:48:23 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id c5so6529464lfp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:48:23 -0700 (PDT)
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr6173851lfo.125.1585936102736;
 Fri, 03 Apr 2020 10:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200402010812.GA751391@yoga> <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 3 Apr 2020 10:48:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Message-ID: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in omap_rproc_request_timer
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 2, 2020 at 6:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> Enable autoreload in set_pwm") in the clockevents tree interacting with
> commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> usage") from the rpmsg tree.
>
> This should have been fixed during the merge of the remoteproc tree
> since it happened after the clockevents tree merge; however, it does not
> look like my email was noticed by either maintainer and I did not pay
> attention when the pull was sent since I was on CC.

Thanks, I've taken this patch directly into my tree since it was my
merge that screwed up.

                   Linus
