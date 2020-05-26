Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747161A3E18
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 Apr 2020 04:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgDJCQ3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 9 Apr 2020 22:16:29 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37646 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgDJCQ2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 22:16:28 -0400
Received: by mail-pj1-f66.google.com with SMTP id z9so270163pjd.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 19:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g3ezOHVTu/DVs9eQ5bfvyVgR22CPV+9l8W/1ERsAjaM=;
        b=EjhWVyK8B16rqGj6Gwx5TFqcG4pWyYbL0yI3j0qO+Vgv03KmaDbFUV31ZOkNUKSTQG
         Oo+dPvSSEBlfQd3X2Y1b5mv/P6y/uU73n8TD8YHf0etFsRWXJ4Uyy/N5YbKVNmoqaP/R
         q2BH8emgUM1SUM5ig2Z4BNPG1a9ZMURsoXsRbaZuVAlmJTbpeAowU825GDC+URy4HxIS
         fRsDmlxFFWLYCxO4zl711XVyLlJTr+cWWmvskWRcCz5gAyrKvSGmj3ZgM6vpygv+9L1U
         3hoiykwzzPGrmxqac7T5E6Qk1yb/jIxb4cxrZSDC8ykI1ZO4S5hfyJtW7okCq7W/uaKy
         sGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g3ezOHVTu/DVs9eQ5bfvyVgR22CPV+9l8W/1ERsAjaM=;
        b=MyBNZ/alFIMdqMwzujSMp8aj9bH5yAKMphXBxSbC7nvsx1AX6IxyKtdTMf3+ZyNJox
         uv8AQkDFzF1qqV6OFcu0WEH7bGfBOO9UCvA5MCnCid8Ui0xK02TlZlLfUgb9rKFAbfcZ
         HRIkC96dxBPwqBJQMSLi2wekvwrLjB1HAhmltvYqpi+PGyJH+oJwvZUh8lKDx2+mHEzB
         k7be85cfBi+r5i7bjLcS1sfsH0SJLzqHkjGQJoz1vPCUUMbKr5vdWTYmb6dYJ60CbU7/
         UdJUmqC2faUoihMl+XCCv80otnOdPx2kPTrSckyqwouqaEwOx5qtVl/hpHSF96wXprmW
         TtEg==
X-Gm-Message-State: AGi0PuZx8gQeV2sJ+kxg/ZRP/hPjiOywX6llql1iZGf0TuYVcWnyqm8V
        3CbDqo8ftlF5BsIw704IEDHtLcDMXJo=
X-Google-Smtp-Source: APiQypJNHYZiUTXCViITxQIb0jbA9ZW5wv2BarRhmw9hMnx+q5iry/q6pNmWq864Mk8uqzFlF3vOkg==
X-Received: by 2002:a17:90a:8a08:: with SMTP id w8mr2762112pjn.119.1586484988292;
        Thu, 09 Apr 2020 19:16:28 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm403583pfx.69.2020.04.09.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 19:16:27 -0700 (PDT)
Date:   Thu, 9 Apr 2020 19:16:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] rpmsg: pull in slab.h
Message-ID: <20200410021636.GZ20625@builder.lan>
References: <20200409211045.12025-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409211045.12025-1-mst@redhat.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 09 Apr 14:10 PDT 2020, Michael S. Tsirkin wrote:

> In preparation to virtio header changes, include slab.h directly as
> this module is using it.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

I presume you have some series where you need these? Otherwise let me
know and I'll pick them up.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/rpmsg/mtk_rpmsg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 232aa4e40133..83f2b8804ee9 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -8,6 +8,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/rpmsg/mtk_rpmsg.h>
> +#include <linux/slab.h>
>  #include <linux/workqueue.h>
>  
>  #include "rpmsg_internal.h"
> -- 
> MST
> 
