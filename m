Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4BB56C846
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 Jul 2022 11:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGIJU2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 9 Jul 2022 05:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiGIJU1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 Jul 2022 05:20:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465FB66AC0
        for <linux-remoteproc@vger.kernel.org>; Sat,  9 Jul 2022 02:20:23 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id sz17so1321100ejc.9
        for <linux-remoteproc@vger.kernel.org>; Sat, 09 Jul 2022 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=TKvyPiNZ+anjmYa10tWJwFVa+LgbgMa6tcU0LfkkBNI=;
        b=Rw4EfubfZ/faCl4SO4kGUHTsF29gYmjUZN5r9EX2QvJZu1MCNedG9zlXeV2AhFrD+e
         SXaisYWxi2fUxcpk19A/i7AtZbMpv3lr7KUgXbxpkLIIUEJyCshVIYNhva/EaDsmb0pp
         34YplPkczi2T6yFHhiVl87ULuueLNlq21qgKhbgzefk/zgF3MSAJ/EB94FuyhPSFpwaS
         LQjwd8/JA89CMxd1TzBKztR50rgjHQG/1pn1q4sYpKoJjmXYoL3DuCwTrbCj9+TXy7u2
         AhJgLh9STUmqhDuCm1GQgtrOxx/JMJRJrDLbc1QMj3bXzNJMrA0fbQKeShJ/tnNmoYAB
         5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TKvyPiNZ+anjmYa10tWJwFVa+LgbgMa6tcU0LfkkBNI=;
        b=6GyRHXWDk4ts/q2G4EbcV15PweKVwnUHhWU7zlThh3LVpN+tu0iD3ne2jX9P2M3YRj
         vv/Zv55VlVz5woLJPOULBMETQFnBdD5JiJADiz+9BNk3tRZUWCUlkpbyV6hnFQ8d5Ptr
         zO1Vzx6neoNF+6Xy4Yvmc2VxyeK84BA2QqPH5W67Sv8szxeUzyZQt9H7mj/ug1YCTpjS
         rw4mEg03+aGHFQZlz72lZZ/z888TsCVe2nRe2Ij03fqXutnxaZjQRFjEYIhZ7qEIg5hw
         kwfF5EN1q5biv3KhAMZ+MexF3iy0DrTj1d+O+AouMue1X4WKKd9fUht6WESYEfJjsTxX
         dUYw==
X-Gm-Message-State: AJIora8qKiliouOPmIGCtr/6LuulkEp2SAkFRiloAqMPN2l9Ee9uDtGc
        q9fYKs/W0eViKjAjIzElfEfCyhaJ0zMh1+tb5OA=
X-Google-Smtp-Source: AGRyM1u+lkUomLC9sj7m2S98v3aFMbUcPQRo+XYLcmPa7mGw7szcEoVya6ud7PjqcZccMjpswFD4wRZfo1uSn8ZwKfk=
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr8101819ejc.721.1657358421741; Sat, 09
 Jul 2022 02:20:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:a40c:0:0:0:0 with HTTP; Sat, 9 Jul 2022 02:20:21
 -0700 (PDT)
From:   John Jacob <jjacobvsusa@gmail.com>
Date:   Sat, 9 Jul 2022 12:20:21 +0300
Message-ID: <CAKZDKkCKN5p+6LNhGP=88n5ZYzzERAMdH-XX-DunqQw+dsw0iQ@mail.gmail.com>
Subject: Confirm Receipt
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Dear,

I am Daniel Affum a retired civil servant i have a  business to
discuss with you from the Eastern part of Africa aimed at agreed
percentage upon your acceptance of my hand in business and friendship.
Kindly respond to me if you are interested to partner with me for an
update.Very important.

Yours Sincerely,
Jacob John.
For,
Daniel Affum.
Reply to: danielaffum005@yahoo.com
