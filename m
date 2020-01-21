Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC5A144502
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Jan 2020 20:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgAUTXK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jan 2020 14:23:10 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43542 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgAUTXK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 14:23:10 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so4016134ljm.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 11:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YKI7RZmx8WIsu/1jkmDBgBIbsrKWimA13AS/a7z41jM=;
        b=OkVCGz+bGet4DPAM/foAEd9BMUu/jrSmT5bD+lpif+woa/1qtYAWKeuae3GN1TXxFC
         fN0PjCyqJxDQXlc+HzwCvn72zC4m1voNdy8vYPK0I2oa076DFfMzYlcS3h8Z7dEUCVhr
         sYhona6mMCuJpDxIy1Tjb8BqMVtEPGCLKgWhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YKI7RZmx8WIsu/1jkmDBgBIbsrKWimA13AS/a7z41jM=;
        b=pzS4xonhoBA7b/0kiF2TatKSw67w4JUfymskzr126sat7nWFQ2YUJl6E+KhlHp5csp
         liMdX1UknHtv7Gg99EZRW4rFyOwPK5MP2uZdHkjbCS1nxXmbIDUkDCI+P7s+tzMijCS/
         e8tUoVeR5+HZIDewlSwRnV3UZkMspGubpkImTB4+HSiQkIZhA0L6/kkoG1uasIuqE1uD
         7/0//l0o3+2tNehYbS6wC6FJGkWwMGf+SzKpsJomJQybUHloowvmSV1Qce/0Sb8W7x/R
         Y/Sa+CSSd3Ysg5BYOUoMnLNlFFLAmAZi2BjyVc9XdaPZIn2N4rRJYVWIkbOpVT725n6F
         Saaw==
X-Gm-Message-State: APjAAAWSrSFo4wooay6ql1/AGJ6bgRTP7YD1XYdGR0rkHI11PJcKB5+d
        v9CgrxgG9bGue3qlSS+NZIORvDs+0Lc=
X-Google-Smtp-Source: APXvYqw5ubZoRh62bISFbaT4T7vaodxQIwP4CmmigTjCDkcKccYh6ahYEKemziSkryUSFpFIYEuVoQ==
X-Received: by 2002:a05:651c:1b0:: with SMTP id c16mr17477683ljn.236.1579634587987;
        Tue, 21 Jan 2020 11:23:07 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id k24sm22850372ljj.27.2020.01.21.11.23.07
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 11:23:07 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id q8so4002684ljj.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 11:23:07 -0800 (PST)
X-Received: by 2002:a2e:b4cf:: with SMTP id r15mr15921775ljm.52.1579634586588;
 Tue, 21 Jan 2020 11:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20200117135130.3605-1-sibis@codeaurora.org> <20200117135130.3605-3-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-3-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 21 Jan 2020 11:22:30 -0800
X-Gmail-Original-Message-ID: <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
Message-ID: <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability
 across clk handling
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
> Define CLKEN and CLKOFF for improving readability of Q6SS clock
> handling.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

It took me awhile to wrap my head around how this new define,
Q6SS_CBCR_TIMEOUT_US, sometimes replaces HALT_CHECK_MAX_LOOPS and
sometimes replaces SLEEP_CHECK_MAX_LOOPS. I guess they're conceptually
different but set to the same value for now? And you've fixed up a
place where the wrong one was used? If you thought the distinction was
meaningless I'd also be fine merging these two defines into one.
Either way, assuming the above is intentional, this looks ok to me.
Thanks for renaming that define.

Reviewed-by: Evan Green <evgreen@chromium.org>
