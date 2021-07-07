Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931E23BED95
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Jul 2021 19:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhGGSAV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Jul 2021 14:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhGGSAU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:00:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A08C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jul 2021 10:57:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n14so6094076lfu.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owuNtJdNSbfSyKHzAYt3EuBOjT8SqaPcQMTJvlBjquc=;
        b=f3Iikb/gIIimF7XR7NPHnX5JqGIGjw2miQlyj0BhoTBUO9gXUNLjfVkeEG+cvlEq8I
         qeFiB82EuqkUsiQ0TlQ6wl9YXlvTKz1cE/XY6i6gEXG8RXRo2fe6HgrcZSqTxl5qbNpM
         zeO0lYj9zB1nyfSmm8Mq+N/WlUIExGnVK1Aes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owuNtJdNSbfSyKHzAYt3EuBOjT8SqaPcQMTJvlBjquc=;
        b=DzCxTfr9UbRLrwcITQQvHLgJz4NLLQSEGBovXKclPSXc9fqr6ama1tQUgT/TtnTRCe
         0Z4BZB2Skp6lnP27uG5lgMBfjI8QhX1hModaVEtjnh/0xxwJjz9JL576S13WxA/r5Wgp
         acubllair74gQ+WgvwSAICh1tET/xUnuinDeDwTEuvypVHFB9ol4AoZNddI4TseCL49F
         hOnw86rpAqWNjrLjB18Dl6bFmpjtL87JYRwrypwVR4B9pkdbWp6WMtRq4LYcnOar7vnr
         7aWVoW9y8Nr6BM5VtgnluYW2bunzNAOSXahtS9yfBbDAx8YtDq9pU9uw4inpceq9yIAt
         EmXw==
X-Gm-Message-State: AOAM530R/RBUR6Ogu4XAEOZv6wKPZ6OHhj9Sv4Fvk/h00TYlLccwERz6
        C/uOGiruKfA+R6fQKSAguGX94XmLdv85FWFM
X-Google-Smtp-Source: ABdhPJyGsoVSuPQExYxeL4brB20TelwHWPPTWij0hTlPWeF06vLBOhfAR1SAq6tsdlHQpP7OgG9KpA==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr19498216ljp.442.1625680657802;
        Wed, 07 Jul 2021 10:57:37 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id f23sm346751lfk.290.2021.07.07.10.57.37
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 10:57:37 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id a18so6067086lfs.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 10:57:37 -0700 (PDT)
X-Received: by 2002:a2e:a48c:: with SMTP id h12mr7468935lji.61.1625680656897;
 Wed, 07 Jul 2021 10:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210706210228.1229484-1-bjorn.andersson@linaro.org> <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
In-Reply-To: <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 10:57:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZradn2SLbZcY=sALkhdat-z=Dc07ZuDca+PWjK0mJZg@mail.gmail.com>
Message-ID: <CAHk-=wiZradn2SLbZcY=sALkhdat-z=Dc07ZuDca+PWjK0mJZg@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v5.14
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Suman Anna <s-anna@ti.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 7, 2021 at 10:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> If you end up adding commits to the end and updating the tag [..]

Actually, that's not what happened, the extra commit is in a separate
branch that got merged early. So I'm not sure why your diffstat and
shortlog were incorrect.

          Linus
