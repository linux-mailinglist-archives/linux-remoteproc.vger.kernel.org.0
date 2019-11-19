Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02F7102AD0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 Nov 2019 18:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfKSRbT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 Nov 2019 12:31:19 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40484 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfKSRbS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Nov 2019 12:31:18 -0500
Received: by mail-io1-f67.google.com with SMTP id p6so24126111iod.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Nov 2019 09:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZKXb08mLw7/gYPbvXLPbBkWtw4UGYUMyffgZIZI+HT0=;
        b=ArmFHtCFR79K59IBtCbRQ9YtpK4dcS1SQ2DILybT8VpuW5oSI+0/OjIkU1lxFXj90/
         g67wwarVmSXF/YEiLI36TyOFoIjfqE27lCCfVjunx2J7PwQuhJWt3gDvFtjUCpYKxgh9
         oVBJkz7zllCUtHe+zYEkA35bMlpX/+bt76IY68FDbH/jA6+he9MBGIXzPgjDy2onhxbt
         MmWvCZG+IUqmlnJ/v5MdvtENnsgyvXm6+Q+U4kXbHucQ25VneEvlZXYpMb/i6Pwua1OF
         iBgGyPJ+pmIvLIBTRt8nvMFDyfyP6H8g7fFrfjUeeOMyL36jz0L55jJ7g10/Y6oDX1NK
         nTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZKXb08mLw7/gYPbvXLPbBkWtw4UGYUMyffgZIZI+HT0=;
        b=YCky7XIb1R/m7gLDuMncYmjVPGN16t3FwLKr0zohb23gZBvOmCnKCzfhn4hniMl7/L
         Wd1xTGESDNNBuFF13eslKw3dguhf2WDXLmYF92U5uSIRQAVwRonMOVYxul0dfYqud+Af
         aLbLJpLJfzXSzqoYUx0ChIumuh567+A3urW70nt52O55mA0NYlHkv5okGXymCF8yEcp+
         S9SFfylW9u950VTaKEgIAYM84ZjQ7AkKH0mEQgqKXV4OmqsLh8jCmUdWKMOfNee/18ab
         e2mIbA9qzM5ISKMkHdQXT6GDBtARgO+Eya+dXJKmS1NO/HMu7K27EDvSciw6cZdF+YJi
         13NQ==
X-Gm-Message-State: APjAAAWH88vpYC/Oa1hJYfmesa2GNqN7kftL4HfqZZl8u0Lzsn6u/dlF
        Nw/KBYsnKxdB5TdHwRdZxAyv9CmEOwTD7XUSW34N4ia+udk=
X-Google-Smtp-Source: APXvYqxuSx88S96OihGrrKgtsaBcR+slNCHyQEu+C35JJbv7CvdH9n0vVrz2XW8a5TUK1UWZLn2OBnY3pHUXCiSjiq8=
X-Received: by 2002:a6b:14ca:: with SMTP id 193mr19398156iou.140.1574184677951;
 Tue, 19 Nov 2019 09:31:17 -0800 (PST)
MIME-Version: 1.0
References: <20191119141645.19777-1-t-kristo@ti.com>
In-Reply-To: <20191119141645.19777-1-t-kristo@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 19 Nov 2019 10:31:06 -0700
Message-ID: <CANLsYkwyLMHzKkm-6X+OgQ+khRYJshMJsxdst7+c7n+hX4nLpQ@mail.gmail.com>
Subject: Re: [PATCHv2 00/15] Remoteproc: updates for OMAP remoteproc support
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 19 Nov 2019 at 07:17, Tero Kristo <t-kristo@ti.com> wrote:
>
> Hi,
>
> This is v2 of the series [1], addressing comments from Bjorn and Rob.
> Bindings patch is funnily v2.5, as I posted v2 already and wanted to
> keep this somehow in sync. Individual patches contain comments about the
> changes, or Reviewed-by tags provided if there are no changes.
>
> I also dropped the conversion patch to SPDX licensing until I can
> confirm the license we want to use. Lets just keep the existing in place
> until that.
>
> This series still depends on the reset + clock patches posted earlier,
> but both of those dependencies are in linux-next now.

I tried to apply your set to today's linux-next (next-20191119) but it
fails at patch 13.

Mathieu

>
> -Tero
>
> [1] https://patchwork.kernel.org/cover/11215421/
>
>
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
