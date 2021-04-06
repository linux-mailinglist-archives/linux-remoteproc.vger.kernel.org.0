Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713EA35569E
	for <lists+linux-remoteproc@lfdr.de>; Tue,  6 Apr 2021 16:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345159AbhDFOaH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 6 Apr 2021 10:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345150AbhDFOaF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Apr 2021 10:30:05 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38762C06175F
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Apr 2021 07:29:57 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso14866584otp.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Apr 2021 07:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hQuAvIyYNagg9JyQzFat1nJUGgDzxw1aFC3YiFQyaP8=;
        b=r0xxTuGtRNzYKu8nqiDI+DB5zSPkGLUpbLgQNQaGLGkgiwpw5MLANjpcq8MYaU0Hq2
         X8hOUDV1/oX/57fSmkTii8Bi2YNGL51y3lk4KSq6YfYCl9xD99P2sRCmzVmEG58kiwA4
         O05ho4ncMEJoZb938OZlbjiRKlK/EjE9hdYwjEFKVhW8aa5VjYe3kTtXHut1plKroA5I
         LK8jHR4u1E1zwzgU3jfR/e97UySNVfA6xtYPZDw8iliqxhEF4hMoTSEYpSrDe0cNmIoT
         5uGPRIzoOUAtKfyfQyD6S4s1F14OHjawgvJvGlkrf0GyIfoE+3kDp/xK61HSyY5bjF7+
         zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hQuAvIyYNagg9JyQzFat1nJUGgDzxw1aFC3YiFQyaP8=;
        b=NsTELsFM7dNcn9Xjm4jFGHhWiQFf0VunA7UzXjDgHS+2H6loXfLz8xGcmTXFeS+ZhA
         cN9DUE1nhBgk3WlAAPtv8qRiEDPH/N32nRo0ZpSmWeYGE2RgWpqYewMN/n+VqWaajrhd
         lB5+shyScVo2TNh82onMuKrHdGrMUIqOeTD0t6vpn9eMMsww95UENhwNkyISk9wIbLXr
         occS0FgZ24CoS/a/KH+tasGxFpKytOdHVAzTvyAvdSrYs/2QhxyBDIjCb7mHq2sdbgi2
         oCLtuAScObVLauT69CS8CWnsxlGi2CTGX6Hed11wl3IYUKHh0R0QgLmXZ2RZwTLOHlgA
         0Ukw==
X-Gm-Message-State: AOAM53321JVZ6/pX9RNsNnQbv5Wb5k3yyzmDaWti85RePR7SIUEr7Zbf
        hJ1aoRwMwjzmj3jy9MFs1Y66rw==
X-Google-Smtp-Source: ABdhPJwoj/Chr5jtxoWPmUxeZgdomq36W/mf+NaHAUUL9Ola9ZGgZLXjYEl5wLxRYiH8O3M4xb6gkw==
X-Received: by 2002:a05:6830:309d:: with SMTP id f29mr26342263ots.225.1617719396349;
        Tue, 06 Apr 2021 07:29:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d13sm4689185otk.74.2021.04.06.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:29:55 -0700 (PDT)
Date:   Tue, 6 Apr 2021 09:29:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Joerg Roedel <jroedel@suse.de>, Wei Liu <wei.liu@kernel.org>,
        Michael Kelley <mikelley@microsoft.com>,
        Mike Rapoport <rppt@kernel.org>,
        Corey Minyard <cminyard@mvista.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-hyperv@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
        kexec@lists.infradead.org, rcu@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Corey Minyard <minyard@acm.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210406142952.GG904837@yoga>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 06 Apr 08:31 CDT 2021, Andy Shevchenko wrote:

> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> At the same time convert users in header and lib folder to use new header.
> Though for time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
