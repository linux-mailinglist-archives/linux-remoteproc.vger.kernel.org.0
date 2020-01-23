Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D01F147418
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Jan 2020 23:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgAWWzT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Jan 2020 17:55:19 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44089 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbgAWWzT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Jan 2020 17:55:19 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so177151ljj.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 14:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvfS7+Fsc/eieI6rBQof74MincBvvBD6LwXZdidYyBU=;
        b=YYLLczpgQOlnXOLDv9csihbQn/ZgD2WlgEYBHaHRdjKx5jpKdyDfOIAnJF3cacZIZ4
         XbTvtmZ6TFJInnwglMMY1JvFSvkXTeZVaWWfa6k5uqO5AL+KoYg6m2clDBwRj0W37QMh
         2FRuAAV4AkTDaT1s4pP0s85aSMcd3qlTQpQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvfS7+Fsc/eieI6rBQof74MincBvvBD6LwXZdidYyBU=;
        b=XhFbiZ1tKGHGCaYfMCW94++5envStlRg8CTGIbdOF/0QT/UXySm1f5AkCeAWkULKf1
         +0rkODiVBaoid59F2D/SkG2P6CQyAsV1Ix8oirs94tWbY9ZugZl6Vn1+lRLZV5ISzNBc
         WchI0WeuMqQomD5Bm8IOSS0fXJvAX8nK69ELneo7mo6Nyn17KcnUZvtMWeHCjluNYL4m
         69TMr4BQxoLL1iYUvtC317vFvODGDqGYbmNDORKidVSBf0+xYHOgQoPI6U+nUPdF+jfs
         VqxmLu5VqXIinNBwQf09QTVIvBuDZxOYSINzHUQ5z7o93QwgTnFG/wPLGcaJAzKzTbnX
         jYdw==
X-Gm-Message-State: APjAAAUD3lDoBv0VJxli5lDZn8wvACLWTOp9xbKZg8Nh28q+sN3jXD4q
        /Q1SlKLdW1VQlU+Tof8W4FkBqRkG1+I=
X-Google-Smtp-Source: APXvYqxoTOEemkOKQC0S/8ULU3lKnL88AgorB9oU5lLPhSM4Hf3CkWK7aMTsQ7TxmeRoHFwCyFlaDg==
X-Received: by 2002:a2e:8188:: with SMTP id e8mr400976ljg.57.1579820117024;
        Thu, 23 Jan 2020 14:55:17 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id t29sm1745362lfg.84.2020.01.23.14.55.15
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 14:55:16 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id v201so3553843lfa.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 14:55:15 -0800 (PST)
X-Received: by 2002:a19:c205:: with SMTP id l5mr31538lfc.159.1579820115268;
 Thu, 23 Jan 2020 14:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20200123131236.1078-1-sibis@codeaurora.org> <20200123131236.1078-3-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-3-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 23 Jan 2020 14:54:39 -0800
X-Gmail-Original-Message-ID: <CAE=gft7H6-jAfPAqeU74D1VPS81vLPgQ6w+JO09C4w1bzwYduw@mail.gmail.com>
Message-ID: <CAE=gft7H6-jAfPAqeU74D1VPS81vLPgQ6w+JO09C4w1bzwYduw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
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
> Define AXI_GATING_VALID_OVERRIDE and fixup comments to improve readability
> of Q6 modem reset sequence on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Very nice, thank you!

Reviewed-by: Evan Green <evgreen@chromium.org>
