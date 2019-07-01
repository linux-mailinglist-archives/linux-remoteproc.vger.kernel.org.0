Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609D65AE11
	for <lists+linux-remoteproc@lfdr.de>; Sun, 30 Jun 2019 06:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbfF3EIc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 30 Jun 2019 00:08:32 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32841 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbfF3EIc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 30 Jun 2019 00:08:32 -0400
Received: by mail-pf1-f195.google.com with SMTP id x15so4901400pfq.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Jun 2019 21:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e0I5Wbh2bYaS07xL/I5DH0yq5CBaIl3bDJRvSpz3Cxw=;
        b=xqjA+u5Ad+vYKVP92a2BTpYUrFDekp/y9vVawsHEjKO7Fg/cSWp1lmsDpDMvwGVdoZ
         jEeR5kHt6l8rIa0BkmkyGwfIKCqldBKhSBfuGhL350FprtHOurblD5rzXm37Qck3Sk8V
         Wr6vunL4r9CLygaJMBdavGShvFfFhFmNjKFp1GYQoIYJyl3r/drB2GnTWcKHZPchmUZq
         +6CPynCiTMXQU0yldwM+CljanzIZFTyD9Ghcs7KT8BMj/w5TPFOOFX0c9s6WNnRLO9lw
         fzlM8mvdgWjRNcNB/aH7BKa2yDw6J7vMg98azPuC6dmAifTgiiVZfDwr0nN2Fc2cRxtW
         smWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e0I5Wbh2bYaS07xL/I5DH0yq5CBaIl3bDJRvSpz3Cxw=;
        b=XFu8IzZa1pHohF505LaUjxK3VLwscOhdkMk0jSH+IVRT46moXX+v6H7JHHljIPA/9E
         +qJ0+VBmdBKGBsDOdZx2yY+BM81E8ZCMC/wq0C7YwFVcIHiaCRVVLJL1Iic6qqCpIX/3
         7X/ZEZhJ//Yt6sIzKuuxCu6Pvk+0r3G84JzSxyEoA38qryDQhoanWW1IVK6o6RHaVuQD
         OkWSuFGXj1RN1LiLW12N5pO23FXF4WAsCnhyf1jsd9N8n4TKXLw0WPtV6zdjo1KrlFZw
         ms41SZ37VVYzH6QBXR/Lr+ZrQursVmxU6WNrgpA7hIiqJG6SYJlssmwzk5NmJFsJLWPZ
         qP6A==
X-Gm-Message-State: APjAAAVfMG1FyQyltSUGpRf32bh/O/el1IkRq1oGFEm5MKeEG/G+eJAN
        gNL6pBSv5usZH2OimMzNpilPlQ==
X-Google-Smtp-Source: APXvYqwD9XJaDKXnwWfO9ySpWpXXJiDmPxZa092n3DTTRMCGd5MlYCVT4ZXl4LKaiWHUyZ+RcuIYSQ==
X-Received: by 2002:a63:1f47:: with SMTP id q7mr17628956pgm.264.1561867711398;
        Sat, 29 Jun 2019 21:08:31 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z11sm5832982pjn.2.2019.06.29.21.08.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2019 21:08:30 -0700 (PDT)
Date:   Sat, 29 Jun 2019 21:08:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] hwspinlock: add the 'in_atomic' API
Message-ID: <20190630040828.GB1263@builder>
References: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 07 Mar 07:58 PST 2019, Fabien Dessenne wrote:

> In its current implementation, the hwspinlock framework relies on jiffies
> to handle the timeout of the hwspin_lock_timeout_xxx() API.
> In an atomic context (or more precisely when irq are disabled) jiffies does not
> increase, which prevents the timeout to reach its target value (infinite loop).
> 
> Note that there is already an hwspinlock user that runs in atomic context
> (drivers/irqchip/irq-stm32-exti.c) and that has to handle by itself the
> timeout.
> 
> The first patch of the series completes the Documentation (the 'raw' API
> is not documented), and the second patch provides with the 'in_atomic' API.
> 

Applied

Thanks,
Bjorn

> Fabien Dessenne (2):
>   hwspinlock: document the hwspinlock 'raw' API
>   hwspinlock: add the 'in_atomic' API
> 
>  Documentation/hwspinlock.txt         | 81 ++++++++++++++++++++++++++++++++++++
>  drivers/hwspinlock/hwspinlock_core.c | 43 +++++++++++++------
>  include/linux/hwspinlock.h           | 61 +++++++++++++++++++++++++--
>  3 files changed, 169 insertions(+), 16 deletions(-)
> 
> -- 
> 2.7.4
> 
