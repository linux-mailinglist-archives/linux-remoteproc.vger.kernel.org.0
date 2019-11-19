Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADA1102B80
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 Nov 2019 19:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfKSSHk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 Nov 2019 13:07:40 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:45262 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfKSSHk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Nov 2019 13:07:40 -0500
Received: by mail-il1-f195.google.com with SMTP id o18so20521114ils.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Nov 2019 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XSGUSmt8DWCWlW8msIL5ALGPJmoB1fkd0qNlWqLeu8k=;
        b=Sk+Vv51z9OEF2Nd65IvmzhNBU4TlFhmlNcI/Os6xZbjg4GHq0BoYEEN6u171Z5Agzq
         3q8XQIlLJ3ZYDM90jSKcuddVt/HMRsClMFg6hrhDNT9TU/AspHhRDQqocDepD5bjwhCq
         Bx97mOKPEPrq1HElEmHHSSxPcVu2lvpWl4QtTGYqTQ8VMAvMg9oCTLA+Rdqyzd5n92xZ
         chjeIYoKPFTRugu92/WZNnD554cNHgihEhQTWbtsUEErp9OX7Ijiw/UgGaodEWuAL5tf
         WAlASgI9/UfmIooC9Ftl54a5FOW+5QdJQeXo1hJAX00BhXZRnO7auMi8xdk8G2638juP
         PbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XSGUSmt8DWCWlW8msIL5ALGPJmoB1fkd0qNlWqLeu8k=;
        b=DmgrZM8QpnzT8B1ZPXHESMD21AxjN9fJF11g57RxqZpwjWefaiZBbM6QDKX/nQzL7U
         Q/3haO8J3dAFghKRHihSO6x2IhnuIOXu2rZ5ZOFilL41moLf/wahvQBfWO/Zk9+o0nse
         BuzEmJqEBMscXidgoDHa6OsNpZlkb7OXVAtOMons7uWJywWkgUc6AKay6jfQqdvPcZiD
         WM7aDAWydQfinQyIL6REu02zcXbjKGp8C0BtpsUP91gPmhJy9l5N2SBPau5kpuBiUFCs
         z4sLq8Q6IwzbA0EM8RetG0qGQrBX/qXkHf6U+2Hi4dHQ6CSUvnf9tKmjZODk533wPpvA
         5dAA==
X-Gm-Message-State: APjAAAVmABusLx+H2Jy9Xbd3xLfBhAUZpkq9bCwnqttvYLjTZPaChHGL
        OwhLvpTr4kqZZ+CrhLlV6oO7TcyjXhZJVuUHoE18Yw==
X-Google-Smtp-Source: APXvYqx9gw2Pd6WfePrc4Gj3pViSbuDuvBNqS6ajS2Oy5htzLNbc/ORkSvCY/OjBI2MG3V2dSxKXistO0VXRWSlyD0A=
X-Received: by 2002:a92:8c49:: with SMTP id o70mr24067717ild.72.1574186859319;
 Tue, 19 Nov 2019 10:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20191119141645.19777-1-t-kristo@ti.com> <CANLsYkwyLMHzKkm-6X+OgQ+khRYJshMJsxdst7+c7n+hX4nLpQ@mail.gmail.com>
In-Reply-To: <CANLsYkwyLMHzKkm-6X+OgQ+khRYJshMJsxdst7+c7n+hX4nLpQ@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 19 Nov 2019 11:07:28 -0700
Message-ID: <CANLsYkwcWDOPx_rpL5RkzsNLyw+ccPE0bNhar6xv1SZ1=R5xmA@mail.gmail.com>
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

On Tue, 19 Nov 2019 at 10:31, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 19 Nov 2019 at 07:17, Tero Kristo <t-kristo@ti.com> wrote:
> >
> > Hi,
> >
> > This is v2 of the series [1], addressing comments from Bjorn and Rob.
> > Bindings patch is funnily v2.5, as I posted v2 already and wanted to
> > keep this somehow in sync. Individual patches contain comments about the
> > changes, or Reviewed-by tags provided if there are no changes.
> >
> > I also dropped the conversion patch to SPDX licensing until I can
> > confirm the license we want to use. Lets just keep the existing in place
> > until that.
> >
> > This series still depends on the reset + clock patches posted earlier,
> > but both of those dependencies are in linux-next now.
>
> I tried to apply your set to today's linux-next (next-20191119) but it
> fails at patch 13.

Digging further into this patch 12 is causing problem on next-20191119 (not 13):

mpoirier@xps15:~/work/remoteproc/kernel-review$ git apply --reject
0012-remoteproc-omap-add-support-for-system-suspend-resum.patch
Checking patch drivers/remoteproc/omap_remoteproc.c...
Hunk #3 succeeded at 85 (offset -1 lines).
Hunk #4 succeeded at 99 (offset -1 lines).
Hunk #5 succeeded at 359 (offset -1 lines).
Hunk #6 succeeded at 544 (offset -1 lines).
Hunk #7 succeeded at 952 (offset -1 lines).
Hunk #8 succeeded at 992 (offset -2 lines).
Checking patch drivers/remoteproc/omap_remoteproc.h...
error: while searching for:
/*
 * Remote processor messaging
 *
 * Copyright (C) 2011 Texas Instruments, Inc.
 * Copyright (C) 2011 Google, Inc.
 * All rights reserved.
 */

error: patch failed: drivers/remoteproc/omap_remoteproc.h:2
Hunk #2 succeeded at 57 (offset 25 lines).
Hunk #3 succeeded at 80 (offset 25 lines).
Applied patch drivers/remoteproc/omap_remoteproc.c cleanly.
Applying patch drivers/remoteproc/omap_remoteproc.h with 1 reject...
Rejected hunk #1.
Hunk #2 applied cleanly.
Hunk #3 applied cleanly.

Your patch expects the last line of the first hunk to be '*/' but it
is '*' in linux-next.

>
> Mathieu
>
> >
> > -Tero
> >
> > [1] https://patchwork.kernel.org/cover/11215421/
> >
> >
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
