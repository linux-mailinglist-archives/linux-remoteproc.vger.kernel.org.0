Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA153DA0E5
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Jul 2021 12:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbhG2KNp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 29 Jul 2021 06:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbhG2KNo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Jul 2021 06:13:44 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15974C061765
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jul 2021 03:13:41 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id o7so5205760ilh.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jul 2021 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+TdfjnoknjFApOLGjXLs0J4WDjQDjp/vuxtasshbZxk=;
        b=Gn11Pt3vZ+KHZc32FjDrb0UjEmRwe4paIntceaDMwlEmglVGwEX/a0plEgq0ahC7xg
         0PK8Du5IKwfMhucJcR26mSWJhXAuyMtwqqthvjYTjXi81MXZVt++aNdTR5I9DezSt/4z
         cMgHxEChoygOcO9BmxBs+8dXPfED391hzxxcvkY/DOgfOTXol3xI4bZWTPxm44OndIYB
         RHjuAHzU149hBU7UyHjuLg3mLor1ZGreTfWaVYjuQl+dWFrg68zhQzQpiV7p8xaJmCai
         raGaGumJzLM+XkEUzR8ySWMnN6NtNklgNTWG9ru48MXSIcshzNjzTBu6xKuop6TuqqPn
         2BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+TdfjnoknjFApOLGjXLs0J4WDjQDjp/vuxtasshbZxk=;
        b=rS+1ikS1jfGYtVK23pA2J+uUbv0IhH5QgGl+VOjFb1G8ESnIQZdLWy+7TKGp2gXgso
         rsh1gH8oGdWarNA/wFD871ROL8nEtv+9uRB7PIlVuKmCdKxiGBAIhtZuOdYH+/87SvMe
         uduEg8u3vOS8zJ4UFkbYdELFuKimw5urs9fBmumViFJXHnJl5lmaLvyB25IkxqM8tTW/
         3ujdz6vqxWVddBBF/jD+hFiBgqeS3ptDQj1D0CABMQWoTTF3LfzdfS+gtuCP+8NnM9K+
         Kgb2+QWuPu7aITTw6IabeeLxZTqdLU07oYzlgOqESttFr28B4SNdTCuSz8ss40BVR5dn
         IGlQ==
X-Gm-Message-State: AOAM531rVLxEHnu7cSRDQU2QCqnrz742p0QdArJIKxJIC8soE5JOwSQU
        xRbeOd3SDIl9fNJ273l9CJwm1IAgpjyBPD+8OHEAhQ==
X-Google-Smtp-Source: ABdhPJzVaRIPI+gmhmquFj539YU94dP14ON4aHJJAYGwACCa+T/e1bBtcfY2VitFFJ+KUnIIOYaJdIJ0IWDPL0b6HgE=
X-Received: by 2002:a05:6e02:d93:: with SMTP id i19mr3091740ilj.72.1627553620250;
 Thu, 29 Jul 2021 03:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210728035859.5405-1-tinghan.shen@mediatek.com> <20210728035859.5405-5-tinghan.shen@mediatek.com>
In-Reply-To: <20210728035859.5405-5-tinghan.shen@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 29 Jul 2021 18:13:29 +0800
Message-ID: <CA+Px+wXwnT5UQ1=deNE4eRpGND1paF+gZ8OD5eX7N1wYJF4Zxw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] remoteproc: mediatek: Support mt8195 scp
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 28, 2021 at 11:58:59AM +0800, Tinghan Shen wrote:
> The SCP clock design is changed on mt8195 that doesn't need to control
> SCP clock on kernel side.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
