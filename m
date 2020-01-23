Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E6914740E
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Jan 2020 23:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgAWWyV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Jan 2020 17:54:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45450 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgAWWyV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Jan 2020 17:54:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id j26so167686ljc.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4i0xRegMdNqxOxG+y1FBl3qD0d4qg24N4qcbY2rQ3vQ=;
        b=h6fTyk31IwwLg8KNhheI3woUC/D2zkf8XziVhs7JXsImTaRLC2DXm9BJAE6u+BMgjK
         73MNy0gWxtpbOyDwxzvluEvf+NqpO/USzFZ726Oz2yVqZNBJk/Lpps9OfFcYEj6AfB9L
         o1Gs5eQMBdoRwGanZpLB0BWUuybs52+Nj83ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4i0xRegMdNqxOxG+y1FBl3qD0d4qg24N4qcbY2rQ3vQ=;
        b=HTo6+0OMd6Ev8P1hb6Vip+ls8xQ1OuvCNps18MUy4sahURbCdsAI5PamymAeD+v+5D
         rGCHohOretzKpy02O4KeweeXUseqmKjCvnFo5/JrJGfSfQ0r4QEd6cHotv/TnghB5AwP
         +ewW06TZK7Y5p1Ls64dOZXb3UYIL9cyQl9sDeIH3nsEN5OIXhVT4nfsjrfQNGvOl4Ee9
         kUZUiASSXEFjXr9ee7/leq08YNRUhi7pAd/41JL9v6ftt9E1ALCqtGJT5PiMmqL3T9zr
         MFuC2fKAKr8bkpnuJ1FWbTLl5l12YwZrl90s4NkhnnS0SmcTiXVziaP9/OpmtnWmtJax
         g5TQ==
X-Gm-Message-State: APjAAAXpuChazpbWAA1Xb6aRu+fxPXOZV4xuN9A9cZPhTQ1YPgvFfKfh
        rNDQdet88zUADoZPDSqqOkMghQ+jRZA=
X-Google-Smtp-Source: APXvYqz86CUKw6gRfxkwwpYbBfOdmdHIhXt4VfqkNm9yZCNcpT7X7Q0Tq/xuUC/B5HBY2CbJu7sUZQ==
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr420851ljc.84.1579820058925;
        Thu, 23 Jan 2020 14:54:18 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id l7sm1730349lfc.80.2020.01.23.14.54.17
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 14:54:18 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id b15so3592213lfc.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 14:54:17 -0800 (PST)
X-Received: by 2002:a05:6512:2035:: with SMTP id s21mr31943lfs.99.1579820057323;
 Thu, 23 Jan 2020 14:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20200123131236.1078-1-sibis@codeaurora.org> <20200123131236.1078-2-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 23 Jan 2020 14:53:41 -0800
X-Gmail-Original-Message-ID: <CAE=gft7sztBTs4mhF2X0eKnjJNBBRxXP5VOr4rsAw=SOYDi4jg@mail.gmail.com>
Message-ID: <CAE=gft7sztBTs4mhF2X0eKnjJNBBRxXP5VOr4rsAw=SOYDi4jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ohad Ben Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 23, 2020 at 5:13 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
