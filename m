Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70E22ECC60
	for <lists+linux-remoteproc@lfdr.de>; Thu,  7 Jan 2021 10:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbhAGJLB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 7 Jan 2021 04:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbhAGJLA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 04:11:00 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CB2C0612F6
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 01:10:20 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m25so12851437lfc.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T+iZKNW1gmpT+HQqIiqmRRpQMcaG8pgogUVWa/pKYOM=;
        b=cyz7QwbTfHcC+qnorIFVkv7DnbL/oyA5L+VJJAN8XWkNMg42oKdig8X5tU4xa7X7pN
         01zspKzmEcVvu5fY2nzlSr3geA/q2812tr8Wz0sUieGMHhvg1aGrsz+m0J4b8Wmr2jr4
         Bxuqd5E5gXQb8ARkFssKYAOK0W62M412pmNUBd9NwRQD04zf23syAxjzcLmFBod8VeLt
         Wkczn2W4OJkxg0o6mQ3tRUOpKTABRCCUpHtxAiPQFjxJEJCf/WQ1QzYZHEZTgGgMtnu2
         jNC0bNdR63+2S3cfHE4fDoxHLsYIWb3l6Ja+q5Vt8aM4kBs1TbyhYMIEDY91gB4GZfH3
         2CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T+iZKNW1gmpT+HQqIiqmRRpQMcaG8pgogUVWa/pKYOM=;
        b=bt1m4n3nX5G18FavPrhWEllRXddFHoORjAALTD50rpyhIXlTTajP1pVA6QMuGbBxMo
         QmqTVxeHmX74ILhu0o3chvzbHIISQMQVvxkNxMrnvkxy9zHBAWwVNnrri3u0M7kZ/mKo
         Wi6n9EL+cLxK8Yszzqfo8I/PpVew9/7qnPCV8mKjPx/ureWUs31BjxtJROx2v8UBFO2V
         umuZrVVU0NlJVQq/RmQOnr6zWpnUMiWNB4MLtYnF6QOaEFIUXl0mnl+PkCAc2i6qDh+f
         jxhkyzddN8USQnx5r3iHqhTeLFvWRDh0Qgae0g7abysQBqqKwZB84oEic169/XKozC8c
         o8rQ==
X-Gm-Message-State: AOAM530w1yhA0OBwuMwuM2I6EQLaVElc85tx39eCYuUsb5FsD5x0PT6K
        VgOPSq2Un6KMRFPRFKgxfl9Nt51quBumnqMnv506WA==
X-Google-Smtp-Source: ABdhPJz6FNuZKYGADUxlk9Tv8Rh/lJVu/2CmZBJO3UIrMaB/edLmB9ZlsVBcuBoQ7GbjgHsRrGXCE/gOnIldpK4OwK0=
X-Received: by 2002:a19:495d:: with SMTP id l29mr3392190lfj.465.1610010618615;
 Thu, 07 Jan 2021 01:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20210104230253.2805217-1-robh@kernel.org>
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 10:10:07 +0100
Message-ID: <CACRpkdZVC8RE-DTes+p6g-1EAHxQWpu2u+sBCX2ei32cvaCrDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 5, 2021 at 12:03 AM Rob Herring <robh@kernel.org> wrote:

> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

This is good. The stricter the better.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
