Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2F5144508
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Jan 2020 20:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgAUTXN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jan 2020 14:23:13 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37352 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgAUTXN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 14:23:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id o13so4046213ljg.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 11:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rCcwlzRHHVYg3hiCBv7NmxGLfftNkVC0+svQxkapXc=;
        b=HoAKMG0wQ2wIiKTC05L+Bn7mtOknDgXQI4PO9uIp4w2SGyA4WKzyeicjM+2gCmY1jr
         vp7Mvfiy1LQGZhgbceOZp21oRkuxUd4XkR1DsidRJ+8vvN8/hSyc9kwfO3vsE4cQ1Lnu
         C9t8CGrIJFnHRmoI4O30boqJZqDvvlnB7z7GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rCcwlzRHHVYg3hiCBv7NmxGLfftNkVC0+svQxkapXc=;
        b=XORB3rwdD/8jU1J7svZUWojKww66/P3dYB1M8fYI6B1A4SdYiyHVKW5CBW6129KFYd
         P7g6Wjli9iANCwUu+0LkEJdGQTAwgKyoC9OxW7Spoq2XGPwTbHmc0bi2iw3EBPRboyFa
         W+UZ8xIzb0CW7x+emfmj1tkXi/mjHpFVElcutruK42hFICOczjk+R0eRkH0R6S4RfhCF
         ZLGQ1nY8g2CEu0ZbzbQ1BK/N0Zd/Bg3wbmupRgncmf5xGCoJdegTBbbnuVSJecG1Fv5l
         BveEhSbx3Sv+7LzvZOq+L9eqETePoks8kHmqkGiemH2yiPBFM4LMqG1dFqk0OBhDi7QJ
         smLA==
X-Gm-Message-State: APjAAAXW3TWSea1eqJ6Uunw7yhQoMKYoZadrudJEO2ROKTwUCzVnEAmh
        DFddreNhS5Tocn96n5dm3LVQE79AWCc=
X-Google-Smtp-Source: APXvYqybq67jJIeIg6A8Fqe8zLlY3w7Vb9ZYQ+a52KgR7n7MuPpAnjiGmJx0Du4v8WYUcs6HqgmgBw==
X-Received: by 2002:a2e:9f47:: with SMTP id v7mr17099839ljk.124.1579634590310;
        Tue, 21 Jan 2020 11:23:10 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id w71sm23351739lff.0.2020.01.21.11.23.08
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 11:23:09 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id m26so3989484ljc.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 11:23:08 -0800 (PST)
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr3453604ljj.253.1579634587850;
 Tue, 21 Jan 2020 11:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20200117135130.3605-1-sibis@codeaurora.org> <20200117135130.3605-4-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-4-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 21 Jan 2020 11:22:31 -0800
X-Gmail-Original-Message-ID: <CAE=gft6WN52R1BckbgK9XCTB8TTY5Z6mh3QooceHTTtzVUmFLw@mail.gmail.com>
Message-ID: <CAE=gft6WN52R1BckbgK9XCTB8TTY5Z6mh3QooceHTTtzVUmFLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Rename boot status timeout
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

On Fri, Jan 17, 2020 at 5:51 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Rename the FSM timeout on SC7180 to BOOT_STATUS_TIMEOUT_US.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
