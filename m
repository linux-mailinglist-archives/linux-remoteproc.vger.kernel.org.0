Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B26736ACA5
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Apr 2021 09:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhDZHGz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 26 Apr 2021 03:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZHGy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Apr 2021 03:06:54 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DD9C061756
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Apr 2021 00:06:11 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id h15so2323661wre.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Apr 2021 00:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5RuHvbrZHVloxRo7eENq0ZIryQnDTJP0ete42G83Dm0=;
        b=rIb8+v2FAdA/HfhwuFQ6R8dphR1T0XKcem+hDmiyp8QJyiWsUG/VegWao1LxxolHOc
         ctEIXLn6mFraIjAcGx8exbmzWC852dgXWwKnm3td7C06aBOHnlsNlS160CFJsN2ch7Vj
         HWWjhQbqWx0x6IG9wItFTZ7CFHUw87oc7fyqNSc+/s7ZHgo7JuV9fKzCZn674JYEsCX6
         +JY2w1OdFXrf2gQXf6S9eNPX7nVE/EMMHAlAlr+3OXLCHkZjMdIqHV0Zr7RTiOc+GI+a
         gWafVirCtDjutoLU7lw5+fWllx0HFwPneUNauWgJcEPM4s8PQEDUE5Fz8Ws+QQ5hE5Rh
         LJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5RuHvbrZHVloxRo7eENq0ZIryQnDTJP0ete42G83Dm0=;
        b=oUY1mhhgxbdCGDX3l+TV6UpoCa2xt/ceSsBEulw7re7kZOAyb7PM9Xaxvh1Ytc0x87
         T7ntl0iAmBScWGKdDYbiVxnDhgtCVjTQ+nYEaoHwnAVbQ0BHYsGu3LBTEyiSYFutRoMi
         RCi80yv9OHTaAIB8Ba6ZXLKWOPSpFUM+HI2hWK5aSN7ejwZf0yAtwYODrNyoDyK8PHjq
         LH0pvO98sX9CTcqqGlJ2KDYs7ZE8ryxIUN1tkjO2I64cUw9k9ldkHrnSyApGE9DaN76C
         MY2YYMc9ar5QJ/Yzr3ekwx0TmfBYDeTPg7I2vI/LwwXx7niUbaJB5IMviOuBb4hACQZM
         1+XQ==
X-Gm-Message-State: AOAM533X9gOeQ775L/h81mrIuZwiduawi13S1MGCGWRC2Ou7iu+nO4sL
        zQezbTqAV+2elpkMjfpKjDxr5Q==
X-Google-Smtp-Source: ABdhPJxQA11AMLyg/X551pHlVu8f4n+OUBOFc1FV8/qEkPz+6JKC49mgf31rgbpUC8pVKrxLOFj9Lw==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr20396301wrq.179.1619420770263;
        Mon, 26 Apr 2021 00:06:10 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id 200sm16751584wmb.1.2021.04.26.00.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 00:06:09 -0700 (PDT)
Date:   Mon, 26 Apr 2021 08:06:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kalle Valo <kvalo@codeaurora.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        Timur Tabi <timur@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION
 defines
Message-ID: <20210426070607.GG6446@dell>
References: <20210425020024.28057-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210425020024.28057-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, 25 Apr 2021, Shawn Guo wrote:

> With commit 312c004d36ce ("[PATCH] driver core: replace "hotplug" by
> "uevent"") already in the tree over a decade, update the name of
> FW_ACTION defines to follow semantics, and reflect what the defines are
> really meant for, i.e. whether or not generate user space event.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/dma/imx-sdma.c                      |  2 +-
>  drivers/media/platform/exynos4-is/fimc-is.c |  2 +-

>  drivers/mfd/iqs62x.c                        |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/misc/lattice-ecp3-config.c          |  2 +-
>  drivers/net/wireless/ti/wlcore/main.c       |  2 +-
>  drivers/platform/x86/dell/dell_rbu.c        |  2 +-
>  drivers/remoteproc/remoteproc_core.c        |  2 +-
>  drivers/scsi/lpfc/lpfc_init.c               |  2 +-
>  drivers/tty/serial/ucc_uart.c               |  2 +-
>  include/linux/firmware.h                    |  4 ++--
>  lib/test_firmware.c                         | 10 +++++-----
>  sound/soc/codecs/wm8958-dsp2.c              |  6 +++---
>  12 files changed, 19 insertions(+), 19 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
