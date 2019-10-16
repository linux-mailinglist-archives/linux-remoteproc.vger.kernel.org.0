Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5CCD91A3
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Oct 2019 14:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbfJPMzu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 16 Oct 2019 08:55:50 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39894 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391575AbfJPMzu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Oct 2019 08:55:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id n7so35871490qtb.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2019 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqxICMW7ss0cJCpXCjJH78wnrlmcwqNrZ/uPiVhGkkM=;
        b=IxEjiKnpR3EAwPoByfW/OZrLpd19bspT+gTUCGnUW80EeuuPdpZRqreDbDpZch6gjh
         2UsT5c44kBgXtYD0yyrrLUBcME6KZ9UAnsIGSS63oAoCPC4JQ8YNVtxKOXCLrMCCA73/
         1uQIrb1Vu1i9W6DwGSI+b+rsQVP1DUrcyk/H0UyUx/1OpKVxCq6ozQE7t+pqdDkUL0sn
         EY3w6X34DDQGKzfHwdSWRQ71+nCXj4FycpczO6kiDghGZfj/sJ+8EwzYRxAizI958o4R
         HynQBp/BM/5tdTJgd+8CJzjA8auJ0h0fkSpoVTv7l/6JzFKR0UBivDwzUwBNh1q7l8cd
         CKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqxICMW7ss0cJCpXCjJH78wnrlmcwqNrZ/uPiVhGkkM=;
        b=AeBYpUvmSxcde/G7PvCs3b+M2gI4swEdtjxllvFbyi3FTItJAi8f8moXVKZD2bReCE
         JWd73YzbWGE1NdlutblJwA9gBOgxlCphJBnDkAaowiIXUN2i/pXSjzBYo4/DvlomtoxV
         EgWiChdLxRb7YiM9AWvTA3p0nlVsC3dg8MQ18PgS1UaIacbrsL5JQ+80jx79ngFgEQUW
         dIwtxKNWhhW7mlqnmsLf0Ile8DcQwihjtJjNh6yymPGhkB2rxbclbfkPApalSMZjLdRZ
         pqZSdZbnHQMZsJ3t38BWT7GiWiGazBfnz0h0pZvAd2iBkBuK4/Z0y6YhqYkECibRyquE
         WlIA==
X-Gm-Message-State: APjAAAW+FsVN7Ok1hEJPsdnC74lHiWZFgEjDlPyHjy9WdPbmYI30I75Q
        sXWjCx7drb+EbDcs/mMhdvelnFQUIveTZ/GsbBT1XA==
X-Google-Smtp-Source: APXvYqwsdZLOyx+1BewFpuZzO2wCBhNDd8cI1RDl+5ftGeKkSjmdr0lrNVyGucGuzJalkmgT4E+Zi8XEFdHBdIzSqJg=
X-Received: by 2002:ac8:2f9b:: with SMTP id l27mr43783932qta.218.1571230549447;
 Wed, 16 Oct 2019 05:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571036463.git.baolin.wang@linaro.org> <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:55:38 +0200
Message-ID: <CACRpkda6hT5Nma-vrtd3oxQ64QppwkmP75DJch2kMUUGpzDzZQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] hwspinlock: u8500_hsem: Remove redundant PM runtime implementation
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 14, 2019 at 9:08 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Since the hwspinlock core has changed the PM runtime to be optional, thus
> remove the redundant PM runtime implementation in the u8500 HWSEM driver.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
